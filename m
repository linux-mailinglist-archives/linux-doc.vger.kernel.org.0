Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADE6214F30
	for <lists+linux-doc@lfdr.de>; Sun,  5 Jul 2020 22:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728139AbgGEUOq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 5 Jul 2020 16:14:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728128AbgGEUOq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 5 Jul 2020 16:14:46 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05757C061794
        for <linux-doc@vger.kernel.org>; Sun,  5 Jul 2020 13:14:46 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C07342E4;
        Sun,  5 Jul 2020 20:14:45 +0000 (UTC)
Date:   Sun, 5 Jul 2020 14:14:44 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tobias Klauser <tklauser@distanz.ch>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation/features: Add kcov
Message-ID: <20200705141444.354cdb23@lwn.net>
In-Reply-To: <20200627092300.29438-1-tklauser@distanz.ch>
References: <20200627092300.29438-1-tklauser@distanz.ch>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 27 Jun 2020 11:23:00 +0200
Tobias Klauser <tklauser@distanz.ch> wrote:

> Add an arch support status file for kcov (ARCH_HAS_KCOV).
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
>  .../features/debug/kcov/arch-support.txt      | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/features/debug/kcov/arch-support.txt

Applied, thanks.

jon
