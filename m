Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3D2456197B
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jun 2022 13:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235121AbiF3LqX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 30 Jun 2022 07:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233592AbiF3LqR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Jun 2022 07:46:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B09335A461
        for <linux-doc@vger.kernel.org>; Thu, 30 Jun 2022 04:46:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 63047B82A3D
        for <linux-doc@vger.kernel.org>; Thu, 30 Jun 2022 11:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18990C385A5;
        Thu, 30 Jun 2022 11:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656589571;
        bh=y23dn3xscoxlX2Hr88BQdcfLioVdD06aIUSMoMRHtvA=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=rR07Abj/wDXH5e4AouaREXvtyQrnW87e87tJKq4ZKB4+lzH7po/52SjphelNLbVQ8
         3+IuRB7NomXz6e29XsgtnnkJsn5UYgU1FMED9VLrsljdJUMnc/MtbeHqFwLg8Qy6Tb
         Ev18iKbjdrdlY+BIT7vESYzg6TnyTGYUxTL9Gxl8f8T9etRqSUTJ+7CmPy9S8jFIQ7
         nsxyGwCHCA/JerbGr37jYF4AB5NbhhyiFiMSA0JPwEPTChWe3Q7BraNyzrZWXLKBjU
         OU6ybckb419id1xGkYEfVE5bRb2JCWyAt7wUbjoQvruAkuCEL08Hcrq8KnFbsds/Ni
         85gXFDP9VfBEg==
From:   Mark Brown <broonie@kernel.org>
To:     marex@denx.de, alsa-devel@alsa-project.org
Cc:     perex@perex.cz, tiwai@suse.de, linux-doc@vger.kernel.org
In-Reply-To: <20220628165807.152191-1-marex@denx.de>
References: <20220628165807.152191-1-marex@denx.de>
Subject: Re: [PATCH] ASoC: doc: Update dead links
Message-Id: <165658956982.346792.17836675302325290041.b4-ty@kernel.org>
Date:   Thu, 30 Jun 2022 12:46:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 28 Jun 2022 18:58:07 +0200, Marek Vasut wrote:
> The alsa-project documentation is now part of the kernel docs,
> the original links are long dead, update links.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: doc: Update dead links
      commit: d15534a6f4cff031f1233154f1e275302c03e5d4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
