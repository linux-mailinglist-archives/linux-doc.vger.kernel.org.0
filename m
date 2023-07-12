Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21718750DBA
	for <lists+linux-doc@lfdr.de>; Wed, 12 Jul 2023 18:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231723AbjGLQNR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 12 Jul 2023 12:13:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbjGLQNP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Jul 2023 12:13:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 397CA1FC7;
        Wed, 12 Jul 2023 09:12:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F2B626182F;
        Wed, 12 Jul 2023 16:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388E6C433C7;
        Wed, 12 Jul 2023 16:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689178315;
        bh=bH0DeCWEj3solc5M8hUdxlWNDNxPeR7LxdcRzSf/Kvg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OzVtnLwpbNJrL7/0tfRuqkoJGpHYL6TaGYcyKNUcpBqHyYwnU1gZCJdTqasHxPt9F
         jf4Yh/aO9/a2nVsroYmcrKbUSTtBn120pwkFRPltibuJ6sooAVqTxCubhtmd+xNupt
         UzfAJElfpQHFPadRZDXOZgdsIFCKVQZjA/EBkpKjvbKWE++2H9FvoTvfMFGkaZu6WO
         p69yBIwbmzFNpLekDz43ikII7anyt/8fVUaflpGK3us93DAx2dSgpZr7dp6R6ecRHL
         0zwC/A9ivM3X1rREbNomVrE74TwKmipwhP/PLcYclbHMAX1RDrUahDPWsti/XbPUga
         p0g3uvKtsljyg==
Date:   Wed, 12 Jul 2023 09:11:54 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, workflows@vger.kernel.org
Subject: Re: [PATCH docs] MAINTAINERS: treat Documentation/maintainer as
 process docs
Message-ID: <20230712091154.7ad7561c@kernel.org>
In-Reply-To: <20230712161011.1339829-1-kuba@kernel.org>
References: <20230712161011.1339829-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 12 Jul 2023 09:10:11 -0700 Jakub Kicinski wrote:
>  F:	Documentation/process/
> +F:	Documentation/maintainer/

Ugh, and looking at it in the email client I remember that m comes
before p. I'll send a v2 tomorrow if nobody nacks.
