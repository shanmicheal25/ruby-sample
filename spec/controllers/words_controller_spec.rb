require 'rails_helper'

RSpec.describe WordsController, type: :controller do
   describe "GET index" do
    before { get :index }
   
    context 'when some words are present' do
      let!(:word) { create(:word) }
      it "assigns @words" do
        # word = Word.create(value: 'cat', language: 'english')
        # word = create(:word)
        expect(assigns(:words)).to eq([word])
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end

    context 'when no words' do
      it "assigns @words" do
        get :index
        expect(assigns(:words)).to eq([])
      end
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe 'GET new' do
  
    context 'when user is signed in ' do
      before do 
        sign_in(create(:user))
        get :new 
      end  

      let(:user) { create(:user) }
      it 'assigns @words' do
          expect(assigns(:word)).to be_a_new(Word)
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end

      it 'http status' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when user is not signed in ' do
      before do 
        get :new 
      end  
      it 'assigns @words' do
          expect(assigns(:word)).to eq(nil)
      end

      it 'renders the new template' do
        expect(response).not_to render_template(:new)
      end

      it 'http status' do
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'POST create ' do
    subject { post :create, params: params }
    context 'when user is signed in' do
      let(:user) { create(:user) }
      before { sign_in(user) }
      context 'Valid path' do
        let!(:language) { create(:language)}
        let(:params) do 
        { word: {content: 'cat', language_id: language.id  } }
        end

        it 'create new word' do
          expect { subject }.to change(Word, :count).from(0).to(1)
        end
      end

      context 'invalid params ' do
        let(:params) do 
        { word: {content: ''} }
        end

        it 'does not create new word' do
          expect { subject }.not_to change(Word, :count)
        end

        it 'http status' do
          expect(response).to have_http_status(200)
        end
      end
    end
    

    # user don't sign in..
    context 'when user is not signed in' do
      context 'Valid path' do
        let!(:language) { create(:language)}
        let(:params) do 
          { word: {content: 'cat', language_id: language.id  } }
        end

        it 'does not create new word' do
          expect { subject }.not_to change(Word, :count)
        end

        it 'http status' do
          expect(response).to have_http_status(200)
        end
      end

      context 'invalid params ' do
        let(:params) do 
        { word: {content: ''} }
        end
        it 'does not create new word' do
          expect { subject }.not_to change(Word, :count)
        end

        it 'http status' do
          expect(response).to have_http_status(200)
        end
      end
    end
  end

  describe 'GET show' do
    before { get :show, params: params }

    let(:params) do
      { id: word.id }
    end
    let!(:word) { create(:word)}

    it 'assigns @words' do
        expect(assigns(:word)).to eq(word)
    end

    it 'renders the new template' do
      expect(response).to render_template(:show)
    end
  end


  describe 'Get edit ' do
    subject { get :edit, params: params }
    let(:params) do
      { id: word.id }
    end
    let!(:word) { create(:word)}

    context 'when user is signed in' do
      let(:user) { create(:user) }
      before do 
        sign_in(user) 
        subject
      end

      it 'assigns @words' do
          expect(assigns(:word)).to eq(word)
      end

      it 'renders the new template' do
        expect(response).to render_template(:edit)
      end
    end

    context 'when user is not signed in' do
      it 'assigns @words' do
          expect(assigns(:word)).to eq(nil)
      end

      it 'http status' do
        subject
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'PUT update ' do
    subject { put :update, params: params }
    let!(:word) { create(:word, content: 'cat', language: language_1 )}
    let!(:language_1) {create(:language, name: 'English')}
    let!(:language_2) {create(:language, name: 'German')}

    context 'when user is signed in' do
      let(:user) { create(:user) }
      before do 
        sign_in(user)
      end
      context 'valid params' do
        let(:params) do
          { id:word.id,  word: { content: 'dog', language_id: language_2.id}}
        end
        it 'updates word' do
          expect { subject }
            .to change { word.reload.content }
            .from('cat')
            .to('dog')
            .and change { word.reload.language }
            .from(language_1)
            .to(language_2)
        end
      end

      context 'invalid params ' do
        let(:params) do 
        { id:word.id,  word: {content: ''} }
        end
        it 'does not update word' do
          expect { subject }.not_to change { word.reload.content }
        end
      end
    end
    
    context 'when user is NOT signed in' do
      context 'valid params' do
        let(:params) do
          { id:word.id,  word: { content: 'dog', language_id: language_2.id}}
        end
        it 'updates word' do
          expect { subject }
            .not_to change { word.reload.content }
        end
      end

      context 'invalid params ' do
        let(:params) do 
        { id:word.id,  word: {content: ''} }
        end
        it 'does not update word' do
          expect { subject }.not_to change { word.reload.content }
        end
      end
    end
    
  end

  describe 'DELETE destroy' do
    subject { delete :destroy, params: params }
    let!(:word) { create(:word) }
    context 'when user is signed in' do
      let(:user) { create(:user) }
      before do 
        sign_in(user)
      end

      context 'valid params' do
        let(:params) do
          { id: word.id }
        end

        it 'delete word' do
          expect { subject }.to change(Word, :count).from(1).to(0)
        end
      end
    end

     context 'when user is not signed in' do
      context 'valid params' do
        let(:params) do
          { id: word.id }
        end

        it 'delete word' do
          expect { subject }.not_to change(Word, :count)
        end
      end
    end
   
  end

end
