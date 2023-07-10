Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52A8A74DFD2
	for <lists+linux-doc@lfdr.de>; Mon, 10 Jul 2023 22:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233351AbjGJUui (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 10 Jul 2023 16:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233213AbjGJUuX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Jul 2023 16:50:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2DD173D;
        Mon, 10 Jul 2023 13:48:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D353C611DC;
        Mon, 10 Jul 2023 20:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20440C433C8;
        Mon, 10 Jul 2023 20:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689021984;
        bh=oUyjvXiwYn8yJN9vlqGtieLzlTeadZq9C9hLh3Yb5o8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DdZg0OrYYcfnsB4rAN4Js7fDcNh6G6HCidsNnohVIK6GxfsHnqdu3z9OkG6eHdn2E
         kHaQmq4/J3Mg3CQDk8DTqnbstr9L7STuTiBeZNoYQ5wnLY+dz5S5nyBS9A4esgzNS2
         FvdYjokIhhwT7MdK12u1hMQHsENRXOJCEMdvfAuAraKnCAqcMdHpEtqk+KfkCGjRe8
         EAuWakQl9mmWJ6SBGokL5yXdt/chCthqaqJrVNzX/aMUhPuvlkjSlRaDPlxfiFQ2+e
         As7jXqcilcXQy9DHSx2L2++UdJ/qkGaAV3utPI2KsG901rZmgWljGLuUOmCNjCYLwA
         hf0SgRKNDOiuA==
Date:   Mon, 10 Jul 2023 13:46:23 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Conor Dooley <conor@kernel.org>
Cc:     workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: Docs for base maintainer expectations?
Message-ID: <20230710134623.659b3bc0@kernel.org>
In-Reply-To: <20230710-veteran-progeny-fee091cfff3c@spud>
References: <20230710115239.3f9e2c24@kernel.org>
        <20230710-snowboard-bannister-7ed66c8d742b@spud>
        <20230710122228.545d93be@kernel.org>
        <20230710-veteran-progeny-fee091cfff3c@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 10 Jul 2023 20:39:40 +0100 Conor Dooley wrote:
> It sounds almost as if you're looking for something to present to people
> when they add themselves as an `M:` entry against a driver, for when
> $company sends a patch w/ someone you've not really seen before?

That is exactly the use I have in mind.
