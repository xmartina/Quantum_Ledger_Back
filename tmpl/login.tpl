{include file="auth_header.tpl"}

<h3>Registration at {$settings.site_name}:</h3><br>

{if $deny_registration}
    We are closed for new registrations now.
{elseif $settings.use_referal_program && $settings.force_upline && !$referer && !$settings.get_rand_ref}
    You do not have an upline. Our system requires an upline for each user.
{else}
    <script language="javascript">
        function checkform() {
            // Place JavaScript form validation here
        }
    </script>

    {if $errors}
        <ul style="color:red">
            {foreach from=$errors item=error}
                <li>{$error}</li>
            {/foreach}
        </ul>
    {/if}

    <form method="post" onsubmit="return checkform()" name="regform">
        <input type="hidden" name="a" value="signup">
        <input type="hidden" name="action" value="signup">
        <!-- Include form fields as required by your application -->
    </form>
{/if}

{include file="auth_footer.tpl"}
