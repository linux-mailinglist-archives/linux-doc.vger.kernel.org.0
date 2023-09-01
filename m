Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4DCC78FEEF
	for <lists+linux-doc@lfdr.de>; Fri,  1 Sep 2023 16:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243331AbjIAOW4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 1 Sep 2023 10:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237954AbjIAOWz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Sep 2023 10:22:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 512B010CF;
        Fri,  1 Sep 2023 07:22:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B7570B8255E;
        Fri,  1 Sep 2023 14:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D72CC433C9;
        Fri,  1 Sep 2023 14:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693578168;
        bh=h1/Wzrzar7jmouGn/w0zA/gRRvOV5e0aTKvFAmaZlek=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=imHaNISNraldq/FXvYhvXFmCGrFiF4lQdF6AOK77QFbEaixunDT1VOUoSxjWvi3SX
         XUI+fFYsVQSoCZm49EebTbmvsucNQVBGbZSboPg67t1lpaedApRXkN05UULbQJOcnR
         uLcdPlsfJw52+rWKkg3xlD1jl1JnWKtm3br42LIIFs3Xalfja+4wMmckzL28XSlWHD
         777pehiDKlSm8Y4sdECyMXBRpToWge67x1rUK3AwahpNi1diiBuj4MbwVCnqOsFwzt
         CBPINhiXyJR1w+1EXRtD85lqGhk7CLf8zn0V4lfauu+o7cY4ryrqG5SqESr5VenS0U
         hxcXVYjAJ16+g==
Date:   Fri, 1 Sep 2023 07:22:47 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Sabrina Dubroca <sd@queasysnail.net>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, corbet@lwn.net, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, rdunlap@infradead.org,
        laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH net v3] docs: netdev: document patchwork patch states
Message-ID: <20230901072247.20f84171@kernel.org>
In-Reply-To: <ZPGjdQOfM2POGoEW@hog>
References: <20230901014131.540821-1-kuba@kernel.org>
        <ZPGjdQOfM2POGoEW@hog>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 1 Sep 2023 10:40:21 +0200 Sabrina Dubroca wrote:
> > v3:
> >  - clarify that patches once set to Awaiting Upstream will stay there  
> 
> mhmm, the patch looks identical to v2. Did you post the wrong version?

oops, forgot to commit, thanks for catching!
