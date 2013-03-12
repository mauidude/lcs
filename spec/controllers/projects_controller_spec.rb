require 'spec_helper'

describe ProjectsController do
  devise_mappings
  login_user

  describe 'GET #new' do
    before :each do
      get :new
    end

    specify { response.should be_successful }
    specify { assigns(:project).should be_new_record }
  end

  describe 'POST #create' do
    context 'when valid' do
      let!(:project) { FactoryGirl.attributes_for(:project) }
      let(:req) { lambda { post :create, project: project } }

      specify { 
        req.call
        response.should redirect_to Project.last 
      }

      specify { 
        expect { req.call }.to change(Project, :count).by(1)
      }

      specify {
        req.call
        flash[:notice].should be_present
      }
    end

    context 'when invalid' do
      let!(:project) { FactoryGirl.attributes_for(:project).merge({ name: '' }) }

      before :each do
        post :create, project: project
      end

      specify { response.should be_successful }
      specify { response.should render_template(:new) }

    end
  end

  describe 'GET #show' do
    let!(:project) { FactoryGirl.create(:project) }

    before :each do
      get :show, id: project
    end

    specify { response.should be_successful }
    specify { assigns(:project).should eq project }
  end

  describe 'GET #edit' do
    let!(:project) { FactoryGirl.create(:project) }

    before :each do
      get :show, id: project
    end

    specify { response.should be_successful }
    specify { assigns(:project).should eq project }
  end

  describe 'PUT #update' do
    context 'when valid' do
      let!(:project) { FactoryGirl.create(:project) }

      before :each do
        put :update, id: project, project: { name: 'New name' }
      end

      specify { response.should redirect_to project.reload }
      specify { project.reload.name.should eq 'New name' }
      specify { flash[:notice].should be_present }
    end

    context 'when invalid' do
      let!(:project) { FactoryGirl.create(:project) }

      before :each do
        put :update, id: project, project: { name: '' }
      end

      specify { response.should be_successful }
      specify { response.should render_template(:edit) }

    end
  end
end
