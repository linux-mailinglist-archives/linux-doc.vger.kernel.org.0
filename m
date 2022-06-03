Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1BA53CCDD
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jun 2022 18:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243612AbiFCQAf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 3 Jun 2022 12:00:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343615AbiFCQAd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 12:00:33 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA9402CDF2
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 09:00:30 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4E44D37C;
        Fri,  3 Jun 2022 16:00:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4E44D37C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1654272030; bh=e41zS/Y6mi+hxmEcuba3vsMI+TFsMKSYsRKi21MNTj4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ftvANF1tBnDE0OlowIKDXz6SH0Jlt6aJxC3qg541sDmYvFcLIHEicWVOy/4X0sDyy
         JlStkbpGLwoecsuYH4k8E5RL3anY5oIj9OyeS2UhV/FZkjeAmTlKap5RAGwE4gVJ+l
         aEul3uGrGo4NB2JbJwcIkD5jbWCMFmYvwsp3QbKZxC5NT3Y3tnq9a7yyeIz1xRI2yv
         msmJ0CMbNXhny2eDU8H1k3C/B3klv8kd7SJpwBnxC5ruNUHzqMIFY4vTKq4sJX+91j
         E7EPXjsOYKjZjcA1jo88eVeAEya2lu8LsS5/coeh3uGGcY9bb6b4PoQBFJXfQB+jcM
         5DRgWT99+FfKg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Adam Turner <aaturnerpython@outlook.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Sphinx pre v3 -- removing support
In-Reply-To: <20220603154229.sj5sfeaehbkfzgin@meerkat.local>
References: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
 <877d5xx1xo.fsf@meer.lwn.net> <YponOKPBgE8pgBYD@casper.infradead.org>
 <20220603154229.sj5sfeaehbkfzgin@meerkat.local>
Date:   Fri, 03 Jun 2022 10:00:42 -0600
Message-ID: <87tu91vis5.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> In the setup, I have it being installed as Sphinx~=2.0 with a comment:
>
>     # Don't use Sphinx-3.x until upstream is happy using it 
>
> I'm happy to upgrade that to a newer version if that condition no longer
> applies.

Upstream is "happy" in that it renders the documentation just fine and
we've dealt with the incompatibilities for our modules.  My only
complaint is the speed, but presumably your automated system has no
trouble being patient :)

jon
