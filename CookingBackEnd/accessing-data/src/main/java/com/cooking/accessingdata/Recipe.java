package com.cooking.accessingdata;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "RECIPE")
public class Recipe {
	@Id
	@Column(name = "recipe_id")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq")
	@SequenceGenerator(name="seq", sequenceName="recipe_seq", allocationSize=1)
	//@GeneratedValue(strategy = GenerationType.AUTO)
	private int recipe_id;	
	private final String recipe_name;
	private final String recipe_description;
	private final String chef_id;
	
	public Recipe() {
        this.recipe_name = "";
        this.recipe_description = "";
        this.chef_id = "";
    }
    
    public Recipe(String recipe_name, String recipe_description, String chef_id) {
        this.recipe_name = recipe_name;
        this.recipe_description = recipe_description;
        this.chef_id = chef_id;
    }

	public int getRecipe_id() {
		return recipe_id;
	}

	public void setRecipe_id(int recipe_id) {
		this.recipe_id = recipe_id;
	}

	public String getRecipe_name() {
		return recipe_name;
	}

	public String getRecipe_description() {
		return recipe_description;
	}

	public String getChef_id() {
		return chef_id;
	}

	@Override
	public String toString() {
		return "Recipe [recipe_name=" + recipe_name + ", recipe_description=" + recipe_description + ", chef_id="
				+ chef_id + "]";
	}    

	
}
