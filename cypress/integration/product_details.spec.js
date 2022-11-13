it('visits the Jungle Homepage', () => {
  cy.visit('http://localhost:3000/')
})

it("There is products on the page", () => {
  cy.get(".products article").should("be.visible");
});

it("navigates to a product page when a product article is clicked", () => {
  cy.get(".products article").contains('Cliff Collard').click()
  
});