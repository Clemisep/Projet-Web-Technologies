<!DOCTYPE html>
<html><body>
<div id="wpbody-content" aria-label="Contenu principal" tabindex="0">
		<div id="screen-meta" class="metabox-prefs">

			<div id="contextual-help-wrap" class="hidden" tabindex="-1" aria-label="Onglet d�aide contextuelle">
				<div id="contextual-help-back"></div>
				<div id="contextual-help-columns">
					<div class="contextual-help-tabs">
						<ul>
						
							<li id="tab-link-overview" class="active">
								<a href="#tab-panel-overview" aria-controls="tab-panel-overview">
									Vue d�ensemble								</a>
							</li>
												</ul>
					</div>

										<div class="contextual-help-sidebar">
						<p><strong>Plus d�informations&nbsp;:</strong></p><p><a href="https://codex.wordpress.org/Users_Your_Profile_Screen" target="_blank">Documentation sur le Profil utilisateur (en)</a></p><p><a href="http://www.wordpress-fr.net/support/" target="_blank">Forums d�entraide</a></p>					</div>
					
					<div class="contextual-help-tabs-wrap">
						
							<div id="tab-panel-overview" class="help-tab-content active">
								<p>Votre profil contient les informations � votre propos (votre �&nbsp;compte&nbsp;�), ainsi que quelques options li�es � votre utilisation personnelle de WordPress.</p><p>Vous pouvez modifier votre mot de passe, activer les raccourcis clavier, modifier la combinaison de couleurs des �crans de l�administration, et d�sactiver l��diteur visuel (WYSIWYG), entre autres choses. Vous pouvez �galement masquer la barre d�outils (anciennement �&nbsp;barre d�administration&nbsp;�) sur la partie publique de votre site, mais elle ne peut pas �tre enlev�e des �crans d�administration.</p><p>Votre identifiant ne peut �tre modifi�, mais vous pouvez utiliser les autres champs pour saisir votre nom complet ou un pseudonyme, et changer ensuite le nom � afficher dans vos articles.</p><p>Vous pouvez vous d�connecter d�autres appareils, tels que votre t�l�phone ou un ordinateur public, en cliquant sur �&nbsp;Me d�connecter partout ailleurs&nbsp;�</p><p>Les champs obligatoires sont indiqu�s, les autres sont facultatifs. Les informations du profil ne sont affich�es que si votre th�me a �t� con�u pour les exploiter.</p><p>Pensez bien � cliquer sur le bouton �&nbsp;Mettre � jour le profil&nbsp;� quand vous aurez termin�.</p>							</div>
											</div>
				</div>
			</div>
				</div>
				<div id="screen-meta-links">
					<div id="contextual-help-link-wrap" class="hide-if-no-js screen-meta-toggle">
			<button type="button" id="contextual-help-link" class="button show-settings" aria-controls="contextual-help-wrap" aria-expanded="false">Aide</button>
			</div>
				</div>
		<div class="update-nag"><a href="https://codex.wordpress.org/Version_4.5.1">WordPress 4.5.1</a> est disponible&nbsp;! <a href="http://hustleisep.fr/wp-admin/update-core.php">Pensez � faire la mise � jour</a>.</div>


<div class="wrap" id="profile-page">
<h1>
Profil</h1><div id="wpseo-dismiss-about" class="yoast-notice notice updated yoast-dismissible is-dismissible" data-nonce="326fca29c3"><p>Yoast SEO a �t� mis � jour en version 3.2.3. <a href="http://hustleisep.fr/wp-admin/admin.php?page=wpseo_dashboard&amp;intro=1">Cliquez ici</a> pour d�couvrir toutes les nouveaut�s !</p>
<a href="/wp-admin/profile.php?wp_http_referer=%2Fwp-admin%2Fusers.php&amp;wpseo-dismiss-about=1&amp;nonce=326fca29c3" type="button" class="notice-dismiss"><span class="screen-reader-text">Dismiss this notice.</span></a></div>
<form id="your-profile" action="http://hustleisep.fr/wp-admin/profile.php" method="post" novalidate="novalidate" enctype="multipart/form-data">
<input type="hidden" id="_wpnonce" name="_wpnonce" value="645ecdc3bf"><input type="hidden" name="_wp_http_referer" value="/wp-admin/profile.php?wp_http_referer=%2Fwp-admin%2Fusers.php">	<input type="hidden" name="wp_http_referer" value="/wp-admin/users.php">
<p>
<input type="hidden" name="from" value="profile">
<input type="hidden" name="checkuser_id" value="1">
</p>

<h2>Options personnelles</h2>

<table class="form-table">
	<tbody><tr class="user-rich-editing-wrap">
		<th scope="row">�diteur visuel</th>
		<td><label for="rich_editing"><input name="rich_editing" type="checkbox" id="rich_editing" value="false"> D�sactiver l��diteur visuel pour �crire</label></td>
	</tr>
<tr class="user-admin-color-wrap">
<th scope="row">Couleurs de l�interface d�administration</th>
<td>	<fieldset id="color-picker" class="scheme-list">
		<legend class="screen-reader-text"><span>Couleurs de l�interface d�administration</span></legend>
		<input type="hidden" id="color-nonce" name="color-nonce" value="6bf7495691">			<div class="color-option selected">
				<input name="admin_color" id="admin_color_fresh" type="radio" value="fresh" class="tog" checked="checked">
				<input type="hidden" class="css_url" value="">
				<input type="hidden" class="icon_colors" value="{&quot;icons&quot;:{&quot;base&quot;:&quot;#999&quot;,&quot;focus&quot;:&quot;#00a0d2&quot;,&quot;current&quot;:&quot;#fff&quot;}}">
				<label for="admin_color_fresh">Par d�faut</label>
				<table class="color-palette">
					<tbody><tr>
											<td style="background-color: #222">&nbsp;</td>
												<td style="background-color: #333">&nbsp;</td>
												<td style="background-color: #0073aa">&nbsp;</td>
												<td style="background-color: #00a0d2">&nbsp;</td>
											</tr>
				</tbody></table>
			</div>
						<div class="color-option ">
				<input name="admin_color" id="admin_color_light" type="radio" value="light" class="tog">
				<input type="hidden" class="css_url" value="http://hustleisep.fr/wp-admin/css/colors/light/colors.min.css">
				<input type="hidden" class="icon_colors" value="{&quot;icons&quot;:{&quot;base&quot;:&quot;#999&quot;,&quot;focus&quot;:&quot;#ccc&quot;,&quot;current&quot;:&quot;#ccc&quot;}}">
				<label for="admin_color_light">Lumineux</label>
				<table class="color-palette">
					<tbody><tr>
											<td style="background-color: #e5e5e5">&nbsp;</td>
												<td style="background-color: #999">&nbsp;</td>
												<td style="background-color: #d64e07">&nbsp;</td>
												<td style="background-color: #04a4cc">&nbsp;</td>
											</tr>
				</tbody></table>
			</div>
						<div class="color-option ">
				<input name="admin_color" id="admin_color_blue" type="radio" value="blue" class="tog">
				<input type="hidden" class="css_url" value="http://hustleisep.fr/wp-admin/css/colors/blue/colors.min.css">
				<input type="hidden" class="icon_colors" value="{&quot;icons&quot;:{&quot;base&quot;:&quot;#e5f8ff&quot;,&quot;focus&quot;:&quot;#fff&quot;,&quot;current&quot;:&quot;#fff&quot;}}">
				<label for="admin_color_blue">Bleu</label>
				<table class="color-palette">
					<tbody><tr>
											<td style="background-color: #096484">&nbsp;</td>
												<td style="background-color: #4796b3">&nbsp;</td>
												<td style="background-color: #52accc">&nbsp;</td>
												<td style="background-color: #74B6CE">&nbsp;</td>
											</tr>
				</tbody></table>
			</div>
						<div class="color-option ">
				<input name="admin_color" id="admin_color_coffee" type="radio" value="coffee" class="tog">
				<input type="hidden" class="css_url" value="http://hustleisep.fr/wp-admin/css/colors/coffee/colors.min.css">
				<input type="hidden" class="icon_colors" value="{&quot;icons&quot;:{&quot;base&quot;:&quot;#f3f2f1&quot;,&quot;focus&quot;:&quot;#fff&quot;,&quot;current&quot;:&quot;#fff&quot;}}">
				<label for="admin_color_coffee">Caf�</label>
				<table class="color-palette">
					<tbody><tr>
											<td style="background-color: #46403c">&nbsp;</td>
												<td style="background-color: #59524c">&nbsp;</td>
												<td style="background-color: #c7a589">&nbsp;</td>
												<td style="background-color: #9ea476">&nbsp;</td>
											</tr>
				</tbody></table>
			</div>
						<div class="color-option ">
				<input name="admin_color" id="admin_color_ectoplasm" type="radio" value="ectoplasm" class="tog">
				<input type="hidden" class="css_url" value="http://hustleisep.fr/wp-admin/css/colors/ectoplasm/colors.min.css">
				<input type="hidden" class="icon_colors" value="{&quot;icons&quot;:{&quot;base&quot;:&quot;#ece6f6&quot;,&quot;focus&quot;:&quot;#fff&quot;,&quot;current&quot;:&quot;#fff&quot;}}">
				<label for="admin_color_ectoplasm">Ectoplasme</label>
				<table class="color-palette">
					<tbody><tr>
											<td style="background-color: #413256">&nbsp;</td>
												<td style="background-color: #523f6d">&nbsp;</td>
												<td style="background-color: #a3b745">&nbsp;</td>
												<td style="background-color: #d46f15">&nbsp;</td>
											</tr>
				</tbody></table>
			</div>
						<div class="color-option ">
				<input name="admin_color" id="admin_color_midnight" type="radio" value="midnight" class="tog">
				<input type="hidden" class="css_url" value="http://hustleisep.fr/wp-admin/css/colors/midnight/colors.min.css">
				<input type="hidden" class="icon_colors" value="{&quot;icons&quot;:{&quot;base&quot;:&quot;#f1f2f3&quot;,&quot;focus&quot;:&quot;#fff&quot;,&quot;current&quot;:&quot;#fff&quot;}}">
				<label for="admin_color_midnight">Minuit</label>
				<table class="color-palette">
					<tbody><tr>
											<td style="background-color: #25282b">&nbsp;</td>
												<td style="background-color: #363b3f">&nbsp;</td>
												<td style="background-color: #69a8bb">&nbsp;</td>
												<td style="background-color: #e14d43">&nbsp;</td>
											</tr>
				</tbody></table>
			</div>
						<div class="color-option ">
				<input name="admin_color" id="admin_color_ocean" type="radio" value="ocean" class="tog">
				<input type="hidden" class="css_url" value="http://hustleisep.fr/wp-admin/css/colors/ocean/colors.min.css">
				<input type="hidden" class="icon_colors" value="{&quot;icons&quot;:{&quot;base&quot;:&quot;#f2fcff&quot;,&quot;focus&quot;:&quot;#fff&quot;,&quot;current&quot;:&quot;#fff&quot;}}">
				<label for="admin_color_ocean">Oc�an</label>
				<table class="color-palette">
					<tbody><tr>
											<td style="background-color: #627c83">&nbsp;</td>
												<td style="background-color: #738e96">&nbsp;</td>
												<td style="background-color: #9ebaa0">&nbsp;</td>
												<td style="background-color: #aa9d88">&nbsp;</td>
											</tr>
				</tbody></table>
			</div>
						<div class="color-option ">
				<input name="admin_color" id="admin_color_sunrise" type="radio" value="sunrise" class="tog">
				<input type="hidden" class="css_url" value="http://hustleisep.fr/wp-admin/css/colors/sunrise/colors.min.css">
				<input type="hidden" class="icon_colors" value="{&quot;icons&quot;:{&quot;base&quot;:&quot;#f3f1f1&quot;,&quot;focus&quot;:&quot;#fff&quot;,&quot;current&quot;:&quot;#fff&quot;}}">
				<label for="admin_color_sunrise">Lever du soleil</label>
				<table class="color-palette">
					<tbody><tr>
											<td style="background-color: #b43c38">&nbsp;</td>
												<td style="background-color: #cf4944">&nbsp;</td>
												<td style="background-color: #dd823b">&nbsp;</td>
												<td style="background-color: #ccaf0b">&nbsp;</td>
											</tr>
				</tbody></table>
			</div>
				</fieldset>
	</td>
</tr>
<tr class="user-comment-shortcuts-wrap">
<th scope="row">Raccourcis clavier</th>
<td><label for="comment_shortcuts"><input type="checkbox" name="comment_shortcuts" id="comment_shortcuts" value="true"> Activer les raccourcis clavier pour la mod�ration de commentaires.</label> <a href="https://codex.wordpress.org/fr:Raccourcis_Clavier" target="_blank">Plus d�informations</a></td>
</tr>
<tr class="show-admin-bar user-admin-bar-front-wrap">
<th scope="row">Barre d�outils</th>
<td><fieldset><legend class="screen-reader-text"><span>Barre d�outils</span></legend>
<label for="admin_bar_front">
<input name="admin_bar_front" type="checkbox" id="admin_bar_front" value="1" checked="checked">
Afficher la barre d�outils lorsque vous visitez le site</label><br>
</fieldset>
</td>
</tr>

</tbody></table>

<h2>Nom</h2>

<table class="form-table">
	<tbody><tr class="user-user-login-wrap">
		<th><label for="user_login">Identifiant</label></th>
		<td><input type="text" name="user_login" id="user_login" value="Admin" disabled="disabled" class="regular-text" style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGP6zwAAAgcBApocMXEAAAAASUVORK5CYII=&quot;);"> <span class="description">Les identifiants ne peuvent �tre modifi�s.</span></td>
	</tr>


<tr class="user-first-name-wrap">
	<th><label for="first_name">Pr�nom</label></th>
	<td><input type="text" name="first_name" id="first_name" value="" class="regular-text"></td>
</tr>

<tr class="user-last-name-wrap">
	<th><label for="last_name">Nom</label></th>
	<td><input type="text" name="last_name" id="last_name" value="" class="regular-text"></td>
</tr>

<tr class="user-nickname-wrap">
	<th><label for="nickname">Pseudonyme <span class="description">(obligatoire)</span></label></th>
	<td><input type="text" name="nickname" id="nickname" value="Admin" class="regular-text"></td>
</tr>

<tr class="user-display-name-wrap">
	<th><label for="display_name">Nom � afficher publiquement</label></th>
	<td>
		<select name="display_name" id="display_name">
					<option selected="selected">Admin</option>
				</select>
	</td>
</tr>
</tbody></table>

<h2>Informations de contact</h2>

<table class="form-table">
<tbody><tr class="user-email-wrap">
	<th><label for="email">Adresse de contact <span class="description">(obligatoire)</span></label></th>
	<td><input type="email" name="email" id="email" value="yoan.alfrede@gmail.com" class="regular-text ltr">
		</td>
</tr>

<tr class="user-url-wrap">
	<th><label for="url">Site web</label></th>
	<td><input type="url" name="url" id="url" value="" class="regular-text code"></td>
</tr>

<tr class="user-googleplus-wrap">
	<th><label for="googleplus">
		Google+	</label></th>
	<td><input type="text" name="googleplus" id="googleplus" value="" class="regular-text"></td>
</tr>
<tr class="user-twitter-wrap">
	<th><label for="twitter">
		Identifiant Twitter (sans le @)	</label></th>
	<td><input type="text" name="twitter" id="twitter" value="" class="regular-text"></td>
</tr>
<tr class="user-facebook-wrap">
	<th><label for="facebook">
		URL du profil Facebook	</label></th>
	<td><input type="text" name="facebook" id="facebook" value="" class="regular-text"></td>
</tr>
</tbody></table>

<h2>� propos de vous</h2>

<table class="form-table">
<tbody><tr class="user-description-wrap">
	<th><label for="description">Renseignements biographiques</label></th>
	<td><textarea name="description" id="description" rows="5" cols="30"></textarea>
	<p class="description">Donnez quelques informations biographiques pour remplir votre profil. Ceci peut �tre affich� publiquement.</p></td>
</tr>

<tr class="user-profile-picture">
	<th>Illustration du profil</th>
	<td>
		<img src="http://2.gravatar.com/avatar/eca702904a6e6811d4ed9300f9024605?s=96&amp;d=identicon&amp;r=g" width="96" height="96" alt="" class="avatar avatar-96 wp-user-avatar wp-user-avatar-96 photo avatar-default">		<p class="description">Vous pouvez changer votre image de profil en passant par <a href="https://fr.gravatar.com/">Gravatar</a>.</p>
	</td>
</tr>

</tbody></table>

<h2>Gestion de compte</h2>
<table class="form-table">
<tbody><tr id="password" class="user-pass1-wrap">
	<th><label for="pass1-text">Nouveau mot de passe</label></th>
	<td>
		<input class="hidden" value=" "><!-- #24364 workaround -->
		<button type="button" class="button button-secondary wp-generate-pw hide-if-no-js">G�n�rer un mot de passe</button>
		<div class="wp-pwd hide-if-js" style="display: none;">
			<span class="password-input-wrapper">
				<input type="password" name="pass1" id="pass1" class="regular-text" value="" autocomplete="off" data-pw="EvD#sDFqV%eqhfB0M%xDn!9N" aria-describedby="pass-strength-result" disabled="" style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGP6zwAAAgcBApocMXEAAAAASUVORK5CYII=&quot;);"><input type="text" id="pass1-text" name="pass1-text" autocomplete="off" class="regular-text" disabled="">
			</span>
			<button type="button" class="button button-secondary wp-hide-pw hide-if-no-js" data-toggle="0" aria-label="Cacher le mot de passe">
				<span class="dashicons dashicons-hidden"></span>
				<span class="text">Cacher</span>
			</button>
			<button type="button" class="button button-secondary wp-cancel-pw hide-if-no-js" data-toggle="0" aria-label="Annuler la modification du mot de passe">
				<span class="text">Annuler</span>
			</button>
			<div style="" id="pass-strength-result" aria-live="polite"></div>
		</div>
	</td>
</tr>
<tr class="user-pass2-wrap hide-if-js" style="display: none;">
	<th scope="row"><label for="pass2">R�p�tez le nouveau mot de passe</label></th>
	<td>
	<input name="pass2" type="password" id="pass2" class="regular-text" value="" autocomplete="off" disabled="" style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGP6zwAAAgcBApocMXEAAAAASUVORK5CYII=&quot;);">
	<p class="description">Veuillez saisir une deuxi�me fois votre mot de passe.</p>
	</td>
</tr>
<tr class="pw-weak">
	<th>Confirmation du mot de passe</th>
	<td>
		<label>
			<input type="checkbox" name="pw_weak" class="pw-checkbox">
			Confirmer l�utilisation d�un mot de passe faible		</label>
	</td>
</tr>

	<tr class="user-sessions-wrap hide-if-no-js">
		<th>Sessions</th>
		<td aria-live="assertive">
			<div class="destroy-sessions"><button type="button" class="button button-secondary" id="destroy-sessions">Me d�connecter partout ailleurs</button></div>
			<p class="description">
				Avez-vous perdu votre t�l�phone ou laiss� votre compte ouvert sur un ordinateur public&nbsp;? Vous pouvez rester connect� ici tout en vous d�connectant partout ailleurs.			</p>
		</td>
	</tr>

</tbody></table>

<input type="hidden" id="wpseo_nonce" name="wpseo_nonce" value="24794258bd"><input type="hidden" name="_wp_http_referer" value="/wp-admin/profile.php?wp_http_referer=%2Fwp-admin%2Fusers.php">
<h3 id="wordpress-seo">R�glages de Yoast SEO</h3>
<table class="form-table">
	<tbody><tr>
		<th>
			<label for="wpseo_author_title">Titre � utiliser pour la page Auteur</label>
		</th>
		<td><input class="regular-text" type="text" id="wpseo_author_title" name="wpseo_author_title" value="">
		</td>
	</tr>
	<tr>
		<th>
			<label for="wpseo_author_metadesc">M�ta description � utiliser pour la page Auteur</label>
		</th>
		<td>
						<textarea rows="3" cols="30" id="wpseo_author_metadesc" name="wpseo_author_metadesc"></textarea>
		</td>
	</tr>
		<tr>
		<th>
			<label for="wpseo_author_exclude">Exclure cet utilisateur du plan de site (sitemap) des auteurs</label>
		</th>
		<td>
			<input class="checkbox double" type="checkbox" id="wpseo_author_exclude" name="wpseo_author_exclude" value="on">
		</td>
	</tr>
</tbody></table>
<br><br>
      <h3>Avatar</h3>
  <table class="form-table">
    <tbody><tr>
      <th><label for="wp_user_avatar">Image</label></th>
      <td>
      <input type="hidden" name="wp-user-avatar" id="wp-user-avatar-existing" value="2571">
          <p id="wpua-add-button-existing"><button type="button" class="button" id="wpua-add-existing" name="wpua-add-existing" data-title="Choose Image: Admin">Choose Image</button></p>
        <div id="wpua-images-existing" class="">
      <p id="wpua-preview-existing">
        <img src="http://2.gravatar.com/avatar/eca702904a6e6811d4ed9300f9024605?s=96&amp;d=identicon&amp;r=g" alt="">
        <span class="description">Original Size</span>
      </p>
      <p id="wpua-thumbnail-existing">
        <img src="http://2.gravatar.com/avatar/eca702904a6e6811d4ed9300f9024605?s=96&amp;d=identicon&amp;r=g" alt="">
        <span class="description">Thumbnail</span>
      </p>
      <p id="wpua-remove-button-existing" class="wpua-hide">
        <button type="button" class="button" id="wpua-remove-existing" name="wpua-remove">Remove Image</button>
              </p>
      <p id="wpua-undo-button-existing"><button type="button" class="button" id="wpua-undo-existing" name="wpua-undo">Undo</button></p>
    </div>
          </td>
    </tr>
  </tbody></table>
    
<h2>Fonctionnalit�s compl�mentaires</h2>
<table class="form-table">
<tbody><tr class="user-capabilities-wrap">
	<th scope="row">Capacit�s</th>
	<td>
wpcf_custom_post_type_view, wpcf_custom_post_type_edit, wpcf_custom_post_type_edit_others, wpcf_custom_taxonomy_view, wpcf_custom_taxonomy_edit, wpcf_custom_taxonomy_edit_others, wpcf_custom_field_view, wpcf_custom_field_edit, wpcf_custom_field_edit_others, wpcf_user_meta_field_view, wpcf_user_meta_field_edit, wpcf_user_meta_field_edit_others	</td>
</tr>
</tbody></table>

<input type="hidden" name="action" value="update">
<input type="hidden" name="user_id" id="user_id" value="1">

<p class="submit"><input type="submit" name="submit" id="submit" class="button button-primary" value="Mettre � jour le profil"></p>
</form>
</div>
<script type="text/javascript">
	if (window.location.hash == '#password') {
		document.getElementById('pass1').focus();
	}
</script>

<div class="clear"></div></div>
</body></html>