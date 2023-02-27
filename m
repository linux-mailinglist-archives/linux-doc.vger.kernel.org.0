Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99A306A475F
	for <lists+linux-doc@lfdr.de>; Mon, 27 Feb 2023 17:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbjB0Q4f (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 27 Feb 2023 11:56:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjB0Q4f (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Feb 2023 11:56:35 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A810610438;
        Mon, 27 Feb 2023 08:56:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 1AFC3CE10CE;
        Mon, 27 Feb 2023 16:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E2CC433EF;
        Mon, 27 Feb 2023 16:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677516989;
        bh=84ta+lWwSex/bYBLNE9tWM13WCnje6JwFdlD5uoryTw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=nKGMuRiBWB8XuP86peRjJL0yfayDQaVI68GyIABdBoeK+Yfa5HH3v4VueT8dZSdBu
         0kMM8Zf/In0RET530Jpk1toMe7dgIXugFBVIpzgFzvaSbLC/VHsuFNismtao/5CzBT
         jMXKDRryKvDoTx47G81o62boeNNYfaSFc0ixHXk99Cp9qbJrONtyCpUkSKzJ84tqO3
         JZLgVgJN1Dy9licAmVjSqfoDlF0dP3+RPXeDWSp0oQ6lu+rhg2xYic8K5vbCmWNW5/
         aJvJ7sbkBDHDiw95OEe8b0RzsZHsj4tYvIy5Gvae9N6T2w7JkPvP+8aaf0XGNKHYJc
         ue9c40oSIfchA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id C08075C0267; Mon, 27 Feb 2023 08:56:28 -0800 (PST)
Date:   Mon, 27 Feb 2023 08:56:28 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net, akpm@linux-foundation.org, ndesaulniers@google.com,
        vbabka@suse.cz, hannes@cmpxchg.org, joel@joelfernandes.org,
        quic_neeraju@quicinc.com, urezki@gmail.com
Subject: Re: [PATCH RFC bootconfig] Allow forcing unconditional bootconfig
 processing
Message-ID: <20230227165628.GH2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20230105005838.GA1772817@paulmck-ThinkPad-P17-Gen-1>
 <20230108002215.c18df95b19acdd3207b379fa@kernel.org>
 <20230107162202.GA4028633@paulmck-ThinkPad-P17-Gen-1>
 <CAMuHMdV9jJvE2y8gY5V_CxidUikCf5515QMZHzTA3rRGEOj6=w@mail.gmail.com>
 <20230225011306.0dd47e760f502b6787096bf7@kernel.org>
 <20230224163307.GN2948950@paulmck-ThinkPad-P17-Gen-1>
 <20230225095811.926a8ebaee4ca2d1fb9d9e45@kernel.org>
 <20230225011910.GV2948950@paulmck-ThinkPad-P17-Gen-1>
 <20230227081632.da70c54f3eede048549fb7af@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227081632.da70c54f3eede048549fb7af@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 27, 2023 at 08:16:32AM +0900, Masami Hiramatsu wrote:
> On Fri, 24 Feb 2023 17:19:10 -0800
> "Paul E. McKenney" <paulmck@kernel.org> wrote:
> 
> > On Sat, Feb 25, 2023 at 09:58:11AM +0900, Masami Hiramatsu wrote:
> > > On Fri, 24 Feb 2023 08:33:07 -0800
> > > "Paul E. McKenney" <paulmck@kernel.org> wrote:
> > > 
> > > > On Sat, Feb 25, 2023 at 01:13:06AM +0900, Masami Hiramatsu wrote:
> > > > > Hi Geert,
> > > > > 
> > > > > On Fri, 24 Feb 2023 09:31:50 +0100
> > > > > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > 
> > > > > > Hi Paul,
> > > > > > 
> > > > > > On Sat, Jan 7, 2023 at 5:33 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> > > > > > > On Sun, Jan 08, 2023 at 12:22:15AM +0900, Masami Hiramatsu wrote:
> > > > > > > > BTW, maybe CONFIG_BOOT_CONFIG_EMBED is better to select this.
> > > > > > > > (or at least recommend to enable this)
> > > > > > >
> > > > > > > Like this?
> > > > > > >
> > > > > > >                                                         Thanx, Paul
> > > > > > >
> > > > > > > ------------------------------------------------------------------------
> > > > > > >
> > > > > > > commit d09a1505c51a70da38b34ac38062977299aef742
> > > > > > > Author: Paul E. McKenney <paulmck@kernel.org>
> > > > > > > Date:   Sat Jan 7 08:09:22 2023 -0800
> > > > > > >
> > > > > > >     bootconfig: Default BOOT_CONFIG_FORCE to y if BOOT_CONFIG_EMBED
> > > > > > >
> > > > > > >     When a kernel is built with CONFIG_BOOT_CONFIG_EMBED=y, the intention
> > > > > > >     will normally be to unconditionally provide the specified kernel-boot
> > > > > > >     arguments to the kernel, as opposed to requiring a separately provided
> > > > > > >     bootconfig parameter.  Therefore, make the BOOT_CONFIG_FORCE Kconfig
> > > > > > >     option default to y in kernels built with CONFIG_BOOT_CONFIG_EMBED=y.
> > > > > > >
> > > > > > >     The old semantics may be obtained by manually overriding this default.
> > > > > > >
> > > > > > >     Suggested-by: Masami Hiramatsu <mhiramat@kernel.org>
> > > > > > >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > > > > > >
> > > > > > > diff --git a/init/Kconfig b/init/Kconfig
> > > > > > > index 0fb19fa0edba9..97a0f14d9020d 100644
> > > > > > > --- a/init/Kconfig
> > > > > > > +++ b/init/Kconfig
> > > > > > > @@ -1379,6 +1379,7 @@ config BOOT_CONFIG
> > > > > > >  config BOOT_CONFIG_FORCE
> > > > > > >         bool "Force unconditional bootconfig processing"
> > > > > > >         depends on BOOT_CONFIG
> > > > > > > +       default y if BOOT_CONFIG_EMBED
> > > > > > >         help
> > > > > > >           With this Kconfig option set, BOOT_CONFIG processing is carried
> > > > > > >           out even when the "bootconfig" kernel-boot parameter is omitted.
> > > > > > 
> > > > > > Thanks for your patch, which is now commit 6ded8a28ed80e4cc
> > > > > > ("bootconfig: Default BOOT_CONFIG_FORCE to y if BOOT_CONFIG_EMBED").
> > > > > > 
> > > > > > After this change, an all{mod,yes}config kernel has:
> > > > > > 
> > > > > >     CONFIG_BOOT_CONFIG_FORCE=y
> > > > > >     CONFIG_BOOT_CONFIG_EMBED=y
> > > > > >     CONFIG_BOOT_CONFIG_EMBED_FILE=""
> > > > > > 
> > > > > > Will this actually work? I haven't tried booting such a kernel yet.
> > > > > 
> > > > > Yeah, good question. It is same as when you boot the kernel with 'bootconfig'
> > > > > but do not add the bootconfig file to initrd. You may see below message
> > > > > on boot log, but kernel boots normally. :)
> > > > > 
> > > > >  'bootconfig' found on command line, but no bootconfig found
> > > > > 
> > > > > (Maybe it is better to fix the message, because if BOOT_CONFIG_FORCE=y, this
> > > > > will be shown without 'bootconfig' on command line.)
> > > > 
> > > > I just tried it again, and for me it just silently ignores the bootconfig
> > > > setup.  Which is what I recall happening when I tried it when creating
> > > > the patch.
> > > > 
> > > > Here is the .config file pieces of interest:
> > > > 
> > > > CONFIG_BOOT_CONFIG=y
> > > > CONFIG_BOOT_CONFIG_FORCE=y
> > > > CONFIG_BOOT_CONFIG_EMBED=y
> > > > CONFIG_BOOT_CONFIG_EMBED_FILE=""
> > > > 
> > > > Anyone else seeing something different?
> > > 
> > > Hmm, from the code, I think you'll see that message in early console log.
> > > 
> > > In init/main.c:
> > > 
> > > ----
> > > #ifdef CONFIG_BOOT_CONFIG
> > > /* Is bootconfig on command line? */
> > > static bool bootconfig_found = IS_ENABLED(CONFIG_BOOT_CONFIG_FORCE);
> > > static size_t initargs_offs;
> > > #else
> > > ----
> > > And
> > > ----
> > > static void __init setup_boot_config(void)
> > > {
> > > ...
> > >         strscpy(tmp_cmdline, boot_command_line, COMMAND_LINE_SIZE);
> > >         err = parse_args("bootconfig", tmp_cmdline, NULL, 0, 0, 0, NULL,
> > >                          bootconfig_params);
> > > 
> > >         if (IS_ERR(err) || !bootconfig_found)
> > >                 return;
> > > 
> > >         /* parse_args() stops at the next param of '--' and returns an address */
> > >         if (err)
> > >                 initargs_offs = err - tmp_cmdline;
> > > 
> > >         if (!data) {
> > >                 pr_err("'bootconfig' found on command line, but no bootconfig found\n");
> > >                 return;
> > >         }
> > > ----
> > > 
> > > Thus, if CONFIG_BOOT_CONFIG_FORCE=y, the process passes the below check
> > > 
> > >         if (IS_ERR(err) || !bootconfig_found)
> > >                 return;
> > > 
> > > But since we have an empty 'data', the error should be printed.
> > 
> > And you are quite right, the runs without data files did get me this:
> > 
> > 'bootconfig' found on command line, but no bootconfig found
> > 
> > Please accept my apologies for my confusion.
> 
> No problem :), so should we skip this message if CONFIG_BOOT_CONFIG_FORCE=y,
> because user may not pass 'bootconfig'?
> 
> Or, may be we can make it;
> 
>  "Skip bootconfig, because no bootconfig data found."
> 
> so that user can notice they forget to set up bootconfig data?

Good point, the current message could be quite confusing.  Me, I already
knew what was happening, so I just looked for the change in console-log
output.  ;-)

How about something like this?

	"No bootconfig data provided, so skipping bootconfig"

But as you say, keeping the current message in kernels that have been
built with CONFIG_BOOT_CONFIG_FORCE=n.

							Thanx, Paul

> Thank you,
> 
> 
> > 
> > 							Thanx, Paul
> > 
> > > Thank you,
> > > 
> > > > 
> > > > 							Thanx, Paul
> > > > 
> > > > > Thank you!
> > > > > 
> > > > > > 
> > > > > > Gr{oetje,eeting}s,
> > > > > > 
> > > > > >                         Geert
> > > > > > 
> > > > > > -- 
> > > > > > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> > > > > > 
> > > > > > In personal conversations with technical people, I call myself a hacker. But
> > > > > > when I'm talking to journalists I just say "programmer" or something like that.
> > > > > >                                 -- Linus Torvalds
> > > > > 
> > > > > 
> > > > > -- 
> > > > > Masami Hiramatsu (Google) <mhiramat@kernel.org>
> > > 
> > > 
> > > -- 
> > > Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> 
> -- 
> Masami Hiramatsu (Google) <mhiramat@kernel.org>
