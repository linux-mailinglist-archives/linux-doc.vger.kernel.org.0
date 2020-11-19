Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF8DF2B9CD8
	for <lists+linux-doc@lfdr.de>; Thu, 19 Nov 2020 22:22:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgKSVTP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 19 Nov 2020 16:19:15 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:54908 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbgKSVTO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Nov 2020 16:19:14 -0500
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 0070E3A303A
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2020 21:07:17 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id A51B3240003;
        Thu, 19 Nov 2020 21:06:55 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        linux-mtd@lists.infradead.org
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] docs: mtd: Avoid htmldocs warnings
Date:   Thu, 19 Nov 2020 22:06:54 +0100
Message-Id: <20201119210654.24754-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201113123831.32429-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: a115d8f6af3815df51a7a81bda7911a8fa1c1ec1
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2020-11-13 at 12:38:31 UTC, Miquel Raynal wrote:
> Moving files around produced the following warnings:
> 
>        Error: Cannot open file drivers/mtd/nand/raw/nand_ecc.c
>        Error: Cannot open file drivers/mtd/nand/raw/nand_ecc.c
> 
> Fix one by just dropping the reference because it is not relevant, the
> other by using a better noun instead of a file name.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel
