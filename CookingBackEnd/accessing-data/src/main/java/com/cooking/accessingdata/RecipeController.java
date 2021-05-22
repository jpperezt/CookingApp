package com.cooking.accessingdata;

import com.cooking.accessingdata.Recipe;
import com.cooking.accessingdata.RecipeRepository;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = "http://localhost:4200")
public class RecipeController {
	
	@Autowired
    private AppRecipeDAO appRecipeDAO;
	
	// standard constructors
    
    private final RecipeRepository recipeRepository;
    private List<Recipe> recipes;
    
    public RecipeController(RecipeRepository recipeRepository) {
        this.recipeRepository = recipeRepository;
    }
    
    //list recipes
    @GetMapping("/recipes")
    public List<Recipe> getRecipes() {
    	recipes = (List<Recipe>) recipeRepository.findAll();
    	return recipes;
    }
    
    //create operation
    @PostMapping("/recipes")
    void addRecipe(@RequestBody Recipe recipe) {
        recipeRepository.save(recipe);
    }
    
    //for delete operation
    @DeleteMapping("/recipes/{recipe_id}")
   	public ResponseEntity<Void> deleteUser(@PathVariable("recipe_id") int recipe_id) {	
    	System.out.println("inside delete method Recipe  = " + recipe_id);
    	recipeRepository.deleteById(recipe_id);
    	return ResponseEntity.noContent().build();
   	}
    
    /*for update operation
    @PutMapping("/recipes/updaterecipe/{id}")
    public String updaterecipeId(@PathVariable("recipe_id") int  recipe_id){
        System.out.print("inside update method Recipe = " + recipe_id);
        Optional<Recipe> testEntity = userRepository.findById(recipe_id);
        //testEntity.map(s->{s.setCourseName("Angular") ;
        recipeRepository.save(s);
        return "recipe updated!!";
        });
        return "updated successfully!!";
    }*/
    
    // Login Operation - get user info
    @GetMapping("/recipes/{recipe_name}")
    public Recipe getRecipe(String recipe_name) {
    	Recipe recipe = this.appRecipeDAO.findRecipe(recipe_name);
    	return recipe;
    }
    
}
