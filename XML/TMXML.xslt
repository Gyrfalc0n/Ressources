<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<Cinema>
			<Films>
				<xsl:for-each select="/Cinema/Films/Film">
					<Film>
						<Titre>
							<xsl:value-of   select="./Titre"/>
						</Titre>
						<Annee>
							<xsl:value-of   select="./Annee"/>
						</Annee>
						<Nationalite>
							<xsl:value-of   select="./Nationalite"/>
						</Nationalite>
						<Genres>
							<xsl:for-each select="./Genres/Genre">
								<Genre>
									<xsl:value-of   select="."/>
								</Genre>
							</xsl:for-each>
						</Genres>
						<Acteurs>
							<xsl:for-each select="./Acteurs/Acteur">
								<Acteur>
									<xsl:value-of   select="."/>
								</Acteur>
							</xsl:for-each>
						</Acteurs>
						<Duree>
							<xsl:value-of   select="./Duree"/>
						</Duree>
						<Realisateur>
							<xsl:value-of   select="./Realisateur"/>
						</Realisateur>
						<Synopsis>
							<xsl:value-of   select="./Synopsis"/>
						</Synopsis>
						<Langues>
							<xsl:for-each select="./Langues/Langue">
								<Langue>
									<xsl:value-of   select="."/>
								</Langue>
							</xsl:for-each>
						</Langues>
						<Notes>
							<Presse>
								<xsl:value-of   select="./Notes/Presse"/>
							</Presse>
							<Spectateurs>
								<xsl:value-of   select="./Notes/Spectateurs"/>
							</Spectateurs>
						</Notes>
						<Seances>
							<xsl:for-each select="./Seances/Jour">
								<Jour>
									<NomDuJour>
										<xsl:value-of   select="./NomDuJour"/>
									</NomDuJour>
									<Horaires>
										<xsl:for-each select="./Horaires/Horaire">
											<Horaire>
												<xsl:value-of   select="."/>
											</Horaire>
										</xsl:for-each>
									</Horaires>
								</Jour>
							</xsl:for-each>
						</Seances>
					</Film>
				</xsl:for-each>
			</Films>
		</Cinema>
	</xsl:template>
</xsl:stylesheet>