# Project Conventions

## Tone
- The tone of the project should be **slightly informal** and **conversational**, aiming to engage readers in a friendly and approachable manner. Still, where appropriate, since the audience is students, we should maintain a level of professionalism and clarity to ensure the content is educational and informative.

- The content is pretty much a 'thinking out loud' style, so it should feel like a dialogue between the author and the reader, rather than a formal presentation of information.

# Mathematical Notation Standards for Multidimensional Image Processing

Establishing a clean, consistent notation system is critical for formulating mathematical frameworks in computer vision, multidimensional image processing, and geometry.

This document outlines standard, widely accepted notation rules bridging 2D image planes ($\mathbb{P}^2$ or $\mathbb{R}^2$) and 3D spatial geometry ($\mathbb{R}^3$ or $\mathbb{P}^3$).

## 1. Fundamental Mathematical Objects
Differentiating the "shape" and dimensionality of your data at a glance is critical.

* **Scalars:** Lowercase italic letters.
  * *Examples:* $x, y, z, \alpha, \lambda, \sigma$.
* **Vectors:** Lowercase bold non-italic letters. Assume column vectors by default.
  * *Examples:* $\mathbf{x}, \mathbf{v}, \mathbf{t}$.
  * *Transpose:* Use a superscript $\top$ (e.g., $\mathbf{x}^\top$) rather than $T$ to avoid confusion with transformations.
* **Matrices:** Uppercase bold non-italic letters.
  * *Examples:* $\mathbf{A}, \mathbf{R}, \mathbf{K}, \mathbf{P}$.
* **Tensors (Multidimensional Arrays):** Uppercase sans-serif bold letters or bold calligraphic letters. Useful for multichannel or volumetric images (e.g., RGB-D or hyperspectral data).
  * *Examples:* $\boldsymbol{\mathsf{X}}, \boldsymbol{\mathcal{T}}$.

## 2. Spaces and Sets
Clearly defining the space an object lives in prevents dimensional mismatch errors, especially when mapping between projective and Euclidean spaces.

* **Spaces:** Blackboard bold uppercase letters.
  * $\mathbb{R}^n$: $n$-dimensional Euclidean space.
  * $\mathbb{P}^n$: $n$-dimensional Projective space (often used for homogeneous coordinates).
  * $\mathbb{Z}^2$: The discrete 2D grid (pixel coordinates).
* **Sets:** Uppercase calligraphic letters.
  * *Examples:* $\mathcal{S}, \mathcal{V}, \mathcal{E}$.

## 3. Coordinates and Geometry
Distinguishing between 2D/3D and inhomogeneous/homogeneous coordinates is essential for maps from $\mathbb{P}^2$ to $\mathbb{R}^3$.

* **2D Image Coordinates:** Lowercase letters.
  * $\mathbf{u} = (u, v)^\top \in \mathbb{R}^2$ or $\mathbf{x} = (x, y)^\top \in \mathbb{R}^2$.
* **3D World Coordinates:** Uppercase letters.
  * $\mathbf{X} = (X, Y, Z)^\top \in \mathbb{R}^3$.
* **Homogeneous Coordinates:** Use a tilde ($\tilde{\cdot}$) or bar ($\bar{\cdot}$) to indicate that a vector is in projective space $\mathbb{P}^n$ (includes an extra scaling dimension).
  * *2D Homogeneous:* $\tilde{\mathbf{u}} = (u, v, 1)^\top \in \mathbb{P}^2$.
  * *3D Homogeneous:* $\tilde{\mathbf{X}} = (X, Y, Z, 1)^\top \in \mathbb{P}^3$.
  * *Equivalence:* Use $\sim$ to denote equality up to a scale factor (e.g., $\tilde{\mathbf{u}} \sim \mathbf{P} \tilde{\mathbf{X}}$).

## 4. Images and Maps
Images are fundamentally functions mapping spatial coordinates to intensities or vectors.

* **Continuous Images:** Uppercase italic letters, defined as continuous functions.
  * $I: \mathbb{R}^2 \rightarrow \mathbb{R}$ (grayscale).
  * $I(x, y)$ or $I(\mathbf{x})$.
* **Discrete Images:** Often represented identically to continuous ones, but explicitly mapped from $\mathbb{Z}^2$. Alternatively, use bracket notation for discrete indices.
  * $I[i, j]$ or $I_{i,j}$ where $(i, j) \in \mathbb{Z}^2$.
* **Natural vs. Synthetic Source:** To ensure compatibility with PDF rendering (avoiding complex LaTeX fonts in Mermaid), use nominal subscripts:
  * **Natural Images:** $I_\text{nat}$ (captured real-world data).
  * **Synthetic Images:** $I_\text{syn}$ (exact computer-generated data).
* **Derivation Functional:** Use a generic functional $F$ to represent the mechanism that derives intermediate representations (AOVs) from an image.
  * $D = F(I; \theta_D)$ where $\theta$ represents the parameters of the derivation mechanism (e.g., neural network weights).
  * $N = F(I; \theta_N)$, etc.
* **Transformations and Mappings:** Use uppercase Greek letters or Calligraphic letters for high-level operators.
  * $\mathcal{R}(I; L_\text{relight})$ for the relighting operation.
  * $L_\text{rel}$ (or $L_r$) for the target lighting condition.

## 5. Operators and Transformations
When treating images as states (rather than just functions of coordinates), use operator or functional notation.

* **Image Operators:** Use square brackets or standard function notation.
  * $\mathcal{R}[I]$ is the relighting operator acting on an image state.
  * $\mathcal{R}(I_\text{nat}; L_r) = I'_\text{nat}$ for a relit natural image.
* **Composition:** Use the $\circ$ operator for sequential mappings (e.g., $\mathcal{R} \circ \mathcal{E}[\mathcal{I}]$ where $\mathcal{E}$ is an enhancement operator).
* **Estimations:** Use a hat ($\hat{\cdot}$) for operators or images that are approximated (e.g., $\hat{\mathcal{R}}$ or $\hat{\mathcal{I}}'$).

## 6. Camera and Projection Standards (The "Pinhole" Standard)
Following Hartley and Zisserman's *Multiple View Geometry* conventions:

* $\mathbf{K} \in \mathbb{R}^{3 \times 3}$: Intrinsic camera calibration matrix.
* $\mathbf{R} \in \mathbb{R}^{3 \times 3}$: Rotation matrix (belongs to the special orthogonal group $SO(3)$).
* $\mathbf{t} \in \mathbb{R}^3$: Translation vector.
* $\mathbf{P} = \mathbf{K} [\mathbf{R} \mid \mathbf{t}] \in \mathbb{R}^{3 \times 4}$: The full camera projection matrix.

## 7. Subscript and Superscript Conventions
* **Subscripts:** Usually for indexing (e.g., $i, j, k$ for pixels, $c$ for color channels, $t$ for time frames). But in some cases, subscripts can also denote metadata or source descriptors when font styles are insufficient (e.g., $I_\text{nat}$ for natural images).
* **Superscripts:** Reserve for mathematical operations ($^\top$, $^{-1}$), distinguishing coordinate frames (e.g., $\mathbf{X}^{(c)}$), or metadata/source descriptors when font styles are insufficient (e.g., $\mathcal{I}^{(captured)}$).
* **Primes:** Use $I'$ to denote a "transformed" or "next-state" version of $I$ after an operation.


## Quarto & Mermaid

- **Math Syntax:** Always use double quotes and double dollar signs for LaTeX in Mermaid nodes: `Node["$$ \text{math} $$"]`.
- **Cell Options:** Use the Mermaid-native `%%|` syntax for options inside `{mermaid}` blocks (e.g., `%%| label: fig-1`) instead of `#|` to avoid parsing errors in some Quarto versions.
