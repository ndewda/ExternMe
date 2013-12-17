class Job < ActiveRecord::Base
  
  belongs_to :user
  # attr_accessible :title, :body
  validates :title, presence: true, length: {maximum: 70}
  validates :descp, presence: true, length: {minimum: 70}
  validates :companyname, presence: true
  validates :link, presence: true, format: {with: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix }
#:uri => { :format => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix }

  def self.create_job(params, user)
    job=user.jobs.build
    job.title = params[:title]
    job.descp = params[:descp]
    job.reqs = params[:reqs]
    job.desire = params[:desire]
    job.link = params[:link]
    job.city = params[:city]
    job.state = params[:state]
    job.companyname = params[:companyname]

    if job.valid?
      job.save!
    end

    return job
  end

  def self.update_attrbs params, job
    job.title = params[:title]
    job.descp = params[:descp]
    job.reqs = params[:reqs]
    job.link = params[:link]
    job.desire = params[:desire]
    job.city = params[:city]
    job.state = params[:state]
    job.companyname = params[:companyname]

    if job.valid?
      job.save!
    end

    return job

  end
end
