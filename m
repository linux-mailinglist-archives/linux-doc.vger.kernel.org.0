Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD132A0CD4
	for <lists+linux-doc@lfdr.de>; Fri, 30 Oct 2020 18:49:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725844AbgJ3Rts (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 30 Oct 2020 13:49:48 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:39940 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726424AbgJ3Rtr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Oct 2020 13:49:47 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 12DD63B1660
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2020 17:27:44 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2CE7DFF80A;
        Fri, 30 Oct 2020 17:27:20 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Richard Weinberger <richard@nod.at>,
        linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 17/56] mtd: rawnand: fix a kernel-doc markup
Date:   Fri, 30 Oct 2020 18:27:20 +0100
Message-Id: <20201030172720.29104-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To:  <9ed47a57d12c40e73a9b01612ee119d39baa6236.1603469755.git.mchehab+huawei@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: e79e6dcbbdced15323708d5bcbba163d5cc540ad
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2020-10-23 at 16:33:04 UTC, Mauro Carvalho Chehab wrote:
> Some identifiers have different names between their prototypes
> and the kernel-doc markup.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
