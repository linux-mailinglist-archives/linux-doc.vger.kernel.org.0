Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45E3921DAEF
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2020 17:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730232AbgGMP6G (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 13 Jul 2020 11:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729027AbgGMP6F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jul 2020 11:58:05 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 074A9C061755
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2020 08:58:04 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A39C42E2;
        Mon, 13 Jul 2020 15:58:04 +0000 (UTC)
Date:   Mon, 13 Jul 2020 09:58:03 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tobias Klauser <tklauser@distanz.ch>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation/features: Remove unicore32 from kcov and
 kmemleak
Message-ID: <20200713095803.7e420ab4@lwn.net>
In-Reply-To: <20200707090922.4746-1-tklauser@distanz.ch>
References: <20200707090922.4746-1-tklauser@distanz.ch>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue,  7 Jul 2020 11:09:22 +0200
Tobias Klauser <tklauser@distanz.ch> wrote:

> Commit 3839a7460721 ("Documentation/features: Add kcov") and
> commit 4641961cff2f ("Documentation/features: Add kmemleak") were added
> shortly after the unicore32 port was removed in commit fb37409a01b0
> ("arch: remove unicore32 port"). Remove the unicore32 feature lines from
> kcov and kmemleak as well.
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
>  Documentation/features/debug/kcov/arch-support.txt     | 1 -
>  Documentation/features/debug/kmemleak/arch-support.txt | 1 -
>  2 files changed, 2 deletions(-)

Applied, thanks.

jon
