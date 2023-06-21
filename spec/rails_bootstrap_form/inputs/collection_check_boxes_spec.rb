# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

# spec/rails_bootstrap_form/inputs/collection_check_boxes_spec.rb

RSpec.describe RailsBootstrapForm::Inputs::CollectionCheckBoxes do
  let(:user) { ::User.new }
  let(:form_builder) { RailsBootstrapForm::BootstrapFormBuilder.new(:user, user, self, {}) }

  describe "#collection_check_boxes" do
    it "renders default Rails helper when bootstrap is disabled" do
      expected = <<~HTML
        <input type="hidden" name="user[skill_ids][]" value="" #{autocomplete_attr} />
        <input type="checkbox" value="1" name="user[skill_ids][]" id="user_skill_ids_1" />
        <label for="user_skill_ids_1">Communication</label>
        <input type="checkbox" value="2" name="user[skill_ids][]" id="user_skill_ids_2" />
        <label for="user_skill_ids_2">Problem Solving</label>
        <input type="checkbox" value="3" name="user[skill_ids][]" id="user_skill_ids_3" />
        <label for="user_skill_ids_3">Leadership</label>
        <input type="checkbox" value="4" name="user[skill_ids][]" id="user_skill_ids_4" />
        <label for="user_skill_ids_4">Writing</label>
        <input type="checkbox" value="5" name="user[skill_ids][]" id="user_skill_ids_5" />
        <label for="user_skill_ids_5">Creativity</label>
        <input type="checkbox" value="6" name="user[skill_ids][]" id="user_skill_ids_6" />
        <label for="user_skill_ids_6">Time Management</label>
        <input type="checkbox" value="7" name="user[skill_ids][]" id="user_skill_ids_7" />
        <label for="user_skill_ids_7">Team Work</label>
        <input type="checkbox" value="8" name="user[skill_ids][]" id="user_skill_ids_8" />
        <label for="user_skill_ids_8">Negotiation</label>
        <input type="checkbox" value="9" name="user[skill_ids][]" id="user_skill_ids_9" />
        <label for="user_skill_ids_9">Decision Making</label>
        <input type="checkbox" value="10" name="user[skill_ids][]" id="user_skill_ids_10" />
        <label for="user_skill_ids_10">Management</label>
      HTML

      actual = form_builder.collection_check_boxes :skill_ids, ::Skill.all, :id, :name, bootstrap: {disabled: true}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in vertical layout" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_skill_ids">Skills</label>
          <div class="rails-bootstrap-forms-collection-check-boxes">
            <input value="" multiple="multiple" #{autocomplete_attr} type="hidden" name="user[skill_ids][]" id="user_skill_ids" />
            <div class="form-check">
              <input id="user_skill_ids_1" class="form-check-input" type="checkbox" value="1" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_1">Communication</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_2" class="form-check-input" type="checkbox" value="2" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_2">Problem Solving</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_3" class="form-check-input" type="checkbox" value="3" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_3">Leadership</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_4" class="form-check-input" type="checkbox" value="4" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_4">Writing</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_5" class="form-check-input" type="checkbox" value="5" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_5">Creativity</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_6" class="form-check-input" type="checkbox" value="6" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_6">Time Management</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_7" class="form-check-input" type="checkbox" value="7" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_7">Team Work</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_8" class="form-check-input" type="checkbox" value="8" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_8">Negotiation</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_9" class="form-check-input" type="checkbox" value="9" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_9">Decision Making</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_10" class="form-check-input" type="checkbox" value="10" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_10">Management</label>
            </div>
          </div>
          <div class="form-text text-muted">Select your strong skills</div>
        </div>
      HTML

      actual = form_builder.collection_check_boxes :skill_ids, ::Skill.all, :id, :name, multiple: true

      expect(actual).to match_html(expected)
    end

    it "renders correctly in inline layout" do
      expected = <<~HTML
        <div class="col-12">
          <label class="form-label visually-hidden required" for="user_skill_ids">Skills</label>
          <div class="rails-bootstrap-forms-collection-check-boxes">
            <input value="" multiple="multiple" #{autocomplete_attr} type="hidden" name="user[skill_ids][]" id="user_skill_ids" />
            <div class="form-check form-check-inline">
              <input id="user_skill_ids_1" class="form-check-input" type="checkbox" value="1" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_1">Communication</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_skill_ids_2" class="form-check-input" type="checkbox" value="2" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_2">Problem Solving</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_skill_ids_3" class="form-check-input" type="checkbox" value="3" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_3">Leadership</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_skill_ids_4" class="form-check-input" type="checkbox" value="4" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_4">Writing</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_skill_ids_5" class="form-check-input" type="checkbox" value="5" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_5">Creativity</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_skill_ids_6" class="form-check-input" type="checkbox" value="6" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_6">Time Management</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_skill_ids_7" class="form-check-input" type="checkbox" value="7" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_7">Team Work</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_skill_ids_8" class="form-check-input" type="checkbox" value="8" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_8">Negotiation</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_skill_ids_9" class="form-check-input" type="checkbox" value="9" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_9">Decision Making</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_skill_ids_10" class="form-check-input" type="checkbox" value="10" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_10">Management</label>
            </div>
          </div>
          <div class="form-text text-muted">Select your strong skills</div>
        </div>
      HTML

      actual = form_builder.collection_check_boxes :skill_ids, ::Skill.all, :id, :name, multiple: true, bootstrap: {layout: :inline}

      expect(actual).to match_html(expected)
    end

    it "renders correctly in horizontal layout" do
      expected = <<~HTML
        <div class="row mb-3">
          <label class="col-form-label col-sm-2 required" for="user_skill_ids">Skills</label>
          <div class="col-sm-10">
            <div class="rails-bootstrap-forms-collection-check-boxes">
              <input value="" multiple="multiple" #{autocomplete_attr} type="hidden" name="user[skill_ids][]" id="user_skill_ids" />
              <div class="form-check">
                <input id="user_skill_ids_1" class="form-check-input" type="checkbox" value="1" name="user[skill_ids][]" />
                <label class="form-check-label" for="user_skill_ids_1">Communication</label>
              </div>
              <div class="form-check">
                <input id="user_skill_ids_2" class="form-check-input" type="checkbox" value="2" name="user[skill_ids][]" />
                <label class="form-check-label" for="user_skill_ids_2">Problem Solving</label>
              </div>
              <div class="form-check">
                <input id="user_skill_ids_3" class="form-check-input" type="checkbox" value="3" name="user[skill_ids][]" />
                <label class="form-check-label" for="user_skill_ids_3">Leadership</label>
              </div>
              <div class="form-check">
                <input id="user_skill_ids_4" class="form-check-input" type="checkbox" value="4" name="user[skill_ids][]" />
                <label class="form-check-label" for="user_skill_ids_4">Writing</label>
              </div>
              <div class="form-check">
                <input id="user_skill_ids_5" class="form-check-input" type="checkbox" value="5" name="user[skill_ids][]" />
                <label class="form-check-label" for="user_skill_ids_5">Creativity</label>
              </div>
              <div class="form-check">
                <input id="user_skill_ids_6" class="form-check-input" type="checkbox" value="6" name="user[skill_ids][]" />
                <label class="form-check-label" for="user_skill_ids_6">Time Management</label>
              </div>
              <div class="form-check">
                <input id="user_skill_ids_7" class="form-check-input" type="checkbox" value="7" name="user[skill_ids][]" />
                <label class="form-check-label" for="user_skill_ids_7">Team Work</label>
              </div>
              <div class="form-check">
                <input id="user_skill_ids_8" class="form-check-input" type="checkbox" value="8" name="user[skill_ids][]" />
                <label class="form-check-label" for="user_skill_ids_8">Negotiation</label>
              </div>
              <div class="form-check">
                <input id="user_skill_ids_9" class="form-check-input" type="checkbox" value="9" name="user[skill_ids][]" />
                <label class="form-check-label" for="user_skill_ids_9">Decision Making</label>
              </div>
              <div class="form-check">
                <input id="user_skill_ids_10" class="form-check-input" type="checkbox" value="10" name="user[skill_ids][]" />
                <label class="form-check-label" for="user_skill_ids_10">Management</label>
              </div>
            </div>
            <div class="form-text text-muted">Select your strong skills</div>
          </div>
        </div>
      HTML

      actual = form_builder.collection_check_boxes :skill_ids, ::Skill.all, :id, :name, multiple: true, bootstrap: {layout: :horizontal}

      expect(actual).to match_html(expected)
    end

    it "renders inline check boxes" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_skill_ids">Skills</label>
          <div class="rails-bootstrap-forms-collection-check-boxes">
            <input value="" multiple="multiple" #{autocomplete_attr} type="hidden" name="user[skill_ids][]" id="user_skill_ids" />
            <div class="form-check form-check-inline">
              <input id="user_skill_ids_1" class="form-check-input" type="checkbox" value="1" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_1">Communication</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_skill_ids_2" class="form-check-input" type="checkbox" value="2" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_2">Problem Solving</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_skill_ids_3" class="form-check-input" type="checkbox" value="3" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_3">Leadership</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_skill_ids_4" class="form-check-input" type="checkbox" value="4" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_4">Writing</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_skill_ids_5" class="form-check-input" type="checkbox" value="5" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_5">Creativity</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_skill_ids_6" class="form-check-input" type="checkbox" value="6" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_6">Time Management</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_skill_ids_7" class="form-check-input" type="checkbox" value="7" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_7">Team Work</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_skill_ids_8" class="form-check-input" type="checkbox" value="8" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_8">Negotiation</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_skill_ids_9" class="form-check-input" type="checkbox" value="9" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_9">Decision Making</label>
            </div>
            <div class="form-check form-check-inline">
              <input id="user_skill_ids_10" class="form-check-input" type="checkbox" value="10" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_10">Management</label>
            </div>
          </div>
          <div class="form-text text-muted">Select your strong skills</div>
        </div>
      HTML

      actual = form_builder.collection_check_boxes :skill_ids, ::Skill.all, :id, :name, multiple: true, bootstrap: {inline: true}

      expect(actual).to match_html(expected)
    end

    it "does not add hidden tag" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_skill_ids">Skills</label>
          <div class="rails-bootstrap-forms-collection-check-boxes">
            <div class="form-check">
              <input id="user_skill_ids_1" class="form-check-input" type="checkbox" value="1" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_1">Communication</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_2" class="form-check-input" type="checkbox" value="2" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_2">Problem Solving</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_3" class="form-check-input" type="checkbox" value="3" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_3">Leadership</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_4" class="form-check-input" type="checkbox" value="4" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_4">Writing</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_5" class="form-check-input" type="checkbox" value="5" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_5">Creativity</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_6" class="form-check-input" type="checkbox" value="6" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_6">Time Management</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_7" class="form-check-input" type="checkbox" value="7" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_7">Team Work</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_8" class="form-check-input" type="checkbox" value="8" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_8">Negotiation</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_9" class="form-check-input" type="checkbox" value="9" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_9">Decision Making</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_10" class="form-check-input" type="checkbox" value="10" name="user[skill_ids][]" />
              <label class="form-check-label" for="user_skill_ids_10">Management</label>
            </div>
          </div>
          <div class="form-text text-muted">Select your strong skills</div>
        </div>
      HTML

      actual = form_builder.collection_check_boxes :skill_ids, ::Skill.all, :id, :name, multiple: true, include_hidden: false

      expect(actual).to match_html(expected)
    end

    it "support single select check box" do
      expected = <<~HTML
        <div class="mb-3">
          <label class="form-label required" for="user_skill_ids">Skills</label>
          <div class="rails-bootstrap-forms-collection-check-boxes">
            <input value="" #{autocomplete_attr} type="hidden" name="user[skill_ids]" id="user_skill_ids" />
            <div class="form-check">
              <input id="user_skill_ids_1" class="form-check-input" type="checkbox" value="1" name="user[skill_ids]" />
              <label class="form-check-label" for="user_skill_ids_1">Communication</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_2" class="form-check-input" type="checkbox" value="2" name="user[skill_ids]" />
              <label class="form-check-label" for="user_skill_ids_2">Problem Solving</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_3" class="form-check-input" type="checkbox" value="3" name="user[skill_ids]" />
              <label class="form-check-label" for="user_skill_ids_3">Leadership</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_4" class="form-check-input" type="checkbox" value="4" name="user[skill_ids]" />
              <label class="form-check-label" for="user_skill_ids_4">Writing</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_5" class="form-check-input" type="checkbox" value="5" name="user[skill_ids]" />
              <label class="form-check-label" for="user_skill_ids_5">Creativity</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_6" class="form-check-input" type="checkbox" value="6" name="user[skill_ids]" />
              <label class="form-check-label" for="user_skill_ids_6">Time Management</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_7" class="form-check-input" type="checkbox" value="7" name="user[skill_ids]" />
              <label class="form-check-label" for="user_skill_ids_7">Team Work</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_8" class="form-check-input" type="checkbox" value="8" name="user[skill_ids]" />
              <label class="form-check-label" for="user_skill_ids_8">Negotiation</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_9" class="form-check-input" type="checkbox" value="9" name="user[skill_ids]" />
              <label class="form-check-label" for="user_skill_ids_9">Decision Making</label>
            </div>
            <div class="form-check">
              <input id="user_skill_ids_10" class="form-check-input" type="checkbox" value="10" name="user[skill_ids]" />
              <label class="form-check-label" for="user_skill_ids_10">Management</label>
            </div>
          </div>
          <div class="form-text text-muted">Select your strong skills</div>
        </div>
      HTML

      actual = form_builder.collection_check_boxes :skill_ids, ::Skill.all, :id, :name, multiple: false

      expect(actual).to match_html(expected)
    end
  end
end
