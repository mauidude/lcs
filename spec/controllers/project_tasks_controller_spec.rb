require 'spec_helper'

describe ProjectTasksController do
  let!(:project) { FactoryGirl.create :project }

  describe 'GET #new' do
    before :each do
      get :new, project_id: project
    end

    specify { response.should be_successful }
    specify { assigns(:project).should eq project }
    specify { assigns(:project_task).should be_new_record }
  end

  describe 'POST #create' do
    let!(:task) { FactoryGirl.create :task }
    let!(:project_task) { FactoryGirl.attributes_for(:project_task).merge({ task_id: task.id }) }
    let(:req) { lambda { post :create, project_id: project, project_task: project_task } }

    context 'when valid' do
      specify {
        req.call
        response.should redirect_to project
      }

      specify {
        expect { req.call }.to change(ProjectTask, :count).by(1)
      }

      specify {
        req.call
        flash[:notice].should be_present
      }
    end

    context 'when not valid' do
      before :each do
        project_task[:hours] = ''
        req.call
      end

      specify { response.should render_template :new }
      specify { assigns(:project_task).should be_present }
    end
  end

  describe 'DELETE #destroy' do
    let!(:project_task) { FactoryGirl.create(:project_task, project: project) }
    let(:req) { lambda { delete :destroy, project_id: project, id: project_task } }

    specify { 
      req.call
      response.should redirect_to project
    }

    specify {
      req.call
      flash[:notice].should be_present
    }

    specify {
      expect { req.call }.to change(ProjectTask, :count).by(-1)
    }
  end
end
