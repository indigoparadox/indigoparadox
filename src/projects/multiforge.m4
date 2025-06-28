divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Multiforge])
define([iwz_section], [projects])
divert(0)include([header.m4])

iwz_sect([Introduction])

iwz_p([Source forges and git hubs come and go. Being backed by a private company gives them the resources to have reach and gather users, but also tends to doom them to activities that those not desperate for profitability may deem unconscionable.])

iwz_p([It is as unfortunate as it is axiomatic that the network effects which make these systems so attractive to venture capital work so well in gathering developers to use them. And so the cycle continues.])

iwz_sect([Self-Hosting])

iwz_p([Self-hosting one's own forge is ideal in many ways. It grants a level of autonomy that commercial forges do not provide. However, it also comes with its own drawbacks:])

iwz_list(
   iwz_li([Other developers are far less likely to sign up and submit pull requests.])
   iwz_li([Hosting costs are not zero. Especially if your projects become popular!])
   iwz_li([Your projects will likely die when you do. Nuggets of context that could otherwise be mined by future generations will be lost forever.])
   iwz_li([Your code is not findable! Nobody will submit pull requests if they cannot find your projects!])
)

iwz_p([Regardless, some degree of autonomy is a necessity, to the extent required to combat the potential decay of centralized platforms. To that end, we believe it is ideal for a modern developer to be autonomously mobile. To be able to jump from one forge to the next (or straddle more than one!) with relatively little difficulty.])

iwz_sect([The Hybrid Approach])

iwz_p([While not perfect, our current solution is a self-hosted platform that pushes updates to several other platforms on a regular basis. This approach brings some of the benefits of self-hosting, while minimizing the costs:])

iwz_list(
   iwz_li([Nobody has to sign up to your site!])
   iwz_li([Hosting costs are less (or nothing, if you simply run your central forge on your own network, pushing all updates to public repos on public forges!)])
   iwz_li([Your projects will live as long as the longest-lived forge on which they exist.])
   iwz_li([Your code can be found!])
)

iwz_p([Of course, there are still drawbacks. This is certainly a more complicated solution than any of its constituent parts! Additionally: as much as your code becomes available to fellow humans, it may also be incorporated into machine learning algorithms. This latter drawback may be mitigated by careful selection of the forges you push to, at the cost of some significant share of reach.])

iwz_sect([Forgejo])

iwz_p([For this plan, we use Forgejo. It can be hosted in a container, a FreeBSD jail, or whatever works for you. It's written in Go and consequently, it's very flexible in how you can set it up!])

iwz_p([The centerpiece of this plan is Forgejo's iwz_a([https://forgejo.org/docs/v11.0/user/repo-mirror/#pushing-to-a-remote-repository], [Push Mirrors]) feature. This allows individual repos to be setup to push to one or more remote code forges.])

iwz_p([Again, there are tradeoffs: This feature must be setup on each repository, for each remote it pushes to. The remote repositories on the code forge sites must be created manually and one must get OAuth keys from those sites setup beforehand. But this also means that it's a simple matter to not push repos to forges you do not wish them to be present on, and you have fine control over whether you want one key for the whole remote site or individual keys per repo.])

iwz_sect([Pull Requests])

iwz_p([Without a doubt, the key benefit to centralized forges is engagement, particularly in the form of issues and pull requests. This situation allows us to merge a pull request on one site, pull it directly down to our local repo, and then push it back up to our self-hosted Forgejo instance. From there, it is pushed back, both to the site on which it originated and any other mirrors present!])

iwz_p([This maximizes our reach in a way no individual centralized forge could. Because Forgejo uses force-pushes for our mirroring, it also tends to run smoothly. Just be sure to grab the repo just after the pull request merge, or there's a chance it may be overwritten!])

iwz_img(
   [/images/multiforge/cycle.png],
   [Diagram of the cycle of code flow from Forgejo to CodeBerg/GitHub, and back to Forgejo.])

iwz_sect([Remote Options])

iwz_p([Additionally, there is the decision of which sites to host on. I've been making use of the following:])

iwz_block_table(
   [iwz_block_table_head([Centralized&nbspForge]) iwz_block_table_head([Notes])],
   [
      iwz_block_table_row([
         iwz_block_table_cell([iwz_a([https://github.com], [GitHub])])
         iwz_block_table_cell(
         [Great reach and engagement, but they do train their ML on your code!]) ])
      iwz_block_table_row([
         iwz_block_table_cell([iwz_a([https://codeberg.org], [CodeBerg])])
         iwz_block_table_cell(
         [Non-profit, but their discovery tools and engagement are still in
            their infancy stages.])
      ])
      iwz_block_table_row([
         iwz_block_table_cell([iwz_a([https://worktree.ca], [WorkTree])])
         iwz_block_table_cell([Canadian-aligned.])])
      iwz_block_table_row([
         iwz_block_table_cell([iwz_a([https://sourceforge.net], [SourceForge])])
         iwz_block_table_cell(
         [They still exist! But they do not seem to support OAuth2. You must use
            your account password.])])
   ],
   [iwz-forge]
)

include([footer.m4])
