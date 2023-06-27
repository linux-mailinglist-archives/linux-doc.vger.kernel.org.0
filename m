Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8E5C73FF27
	for <lists+linux-doc@lfdr.de>; Tue, 27 Jun 2023 17:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231582AbjF0PBV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 27 Jun 2023 11:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbjF0PBT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Jun 2023 11:01:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD6E01A2;
        Tue, 27 Jun 2023 08:01:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 79E2E611B6;
        Tue, 27 Jun 2023 15:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F03C433C0;
        Tue, 27 Jun 2023 15:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1687878077;
        bh=FmjMVSDHqeAIJptt/nVmy58Tnomqxy2hAC/gfkgzLHQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aKOhniKI7EzWB6KhjM/XagOAYkFoWF4TiPQcGShSHI50fC2ICL33V2LoQvG6w95F0
         vW6mheMgSXS8OSSWMKntz7l6OkILRyUuTCYDo0+4NsziYS6pRNMoblpeOvt1ez7d2a
         LElPp7xp6HlmhoIxtipXwtocCa6V60n6otrWn88s=
Date:   Tue, 27 Jun 2023 17:01:15 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Jason Baron <jbaron@akamai.com>,
        Jim Cromie <jim.cromie@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/3] dyndbg: add source file name to prefix
Message-ID: <2023062705-foil-playing-b2da@gregkh>
References: <20221223-dyndbg-filename-v1-0-cbf8543009a1@weissschuh.net>
 <896d52bd-20b5-4507-99c6-de4b86f9141c@t-8ch.de>
 <2023062759-backspin-disperser-cd54@gregkh>
 <79a77af6-c5f5-4abb-ae46-cdcf4d40b75e@t-8ch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79a77af6-c5f5-4abb-ae46-cdcf4d40b75e@t-8ch.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 27, 2023 at 04:57:35PM +0200, Thomas Wei�schuh wrote:
> On 2023-06-27 16:47:26+0200, Greg Kroah-Hartman wrote:
> > On Tue, Jun 27, 2023 at 04:30:56PM +0200, Thomas Wei�schuh wrote:
> > > Hi Luis and Greg,
> > > 
> > > it seems you are the ones picking up patches for dyndbg.
> > > 
> > > Could you take a look at this series?
> > > It has Acks from both Jason and Jim.
> > 
> > It's the middle of the merge window, we can't take anything new, sorry.
> 
> Just noticed this, too. Sorry for the noise.
> 
> > Care to submit it after 6.5-rc1 is out?
> 
> I'll ping again should it still apply cleanly to 6.5-rc1
> othewise I'll resend.

Resend would be good as this is long gone from out inboxes...
