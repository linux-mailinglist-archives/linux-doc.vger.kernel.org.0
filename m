Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D434F422E55
	for <lists+linux-doc@lfdr.de>; Tue,  5 Oct 2021 18:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236606AbhJEQuM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 5 Oct 2021 12:50:12 -0400
Received: from ale.deltatee.com ([204.191.154.188]:44372 "EHLO
        ale.deltatee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236690AbhJEQuM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Oct 2021 12:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:Message-Id:Date:Cc:To:From
        :references:content-disposition:in-reply-to;
        bh=uErNDWtyHIBmid4jyg5TQAPNLYpHrbLQkRhkR2esVR8=; b=fMq9tnv8/txWnsmOLZm7Jl46h3
        OzCzofJjTVJUsi8x30NxDM7dmkHDhtYPQIZ8VZt8ot2qvrz6sWJD+rtKR6jdnqTBpKQ5qso0A1IqI
        WUvk90XQnveXWIERxGpUTNoWEauvGyJL1zjuZgrm9ZGdrfSdfFhmormcljE4Intry3ciaDhUA/tuk
        mL+2O6yolkZrDDGezArriWW6RhRavD67de0CjXLVSFWCCSy6Qr/mAY4JQVWDluGBkdgV3fd3c5stt
        Y0O5WWUuMpTIS9neSCxo+8F3xTtIUXyWvy3dTEzbYP4Y4zBncP0eWQfrdgZBOdKfyS0Lg6t0jkrGB
        GkaUeTyQ==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
        by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <gunthorp@deltatee.com>)
        id 1mXnc0-0007Y9-G4; Tue, 05 Oct 2021 10:48:18 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.94.2)
        (envelope-from <gunthorp@deltatee.com>)
        id 1mXnby-00049r-R6; Tue, 05 Oct 2021 10:48:14 -0600
From:   Logan Gunthorpe <logang@deltatee.com>
To:     Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
Cc:     linux-doc@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Tue,  5 Oct 2021 10:48:12 -0600
Message-Id: <20211005164812.15938-1-logang@deltatee.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: hch@lst.de, iommu@lists.linux-foundation.org, linux-doc@vger.kernel.org, logang@deltatee.com, sfr@canb.auug.org.au
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        GREYLIST_ISWHITE,MYRULES_NO_TEXT,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.2
Subject: [PATCH] dma-mapping: fix the kerneldoc for dma_map_sgtable()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

htmldocs began producing the following warnings:

  kernel/dma/mapping.c:256: WARNING: Definition list ends without a
             blank line; unexpected unindent.
  kernel/dma/mapping.c:257: WARNING: Bullet list ends without a blank
             line; unexpected unindent.

Reformatting the list without hyphens fixes the warnings and produces
both a readable text and HTML output.

Fixes: fffe3cc8c219 ("dma-mapping: allow map_sg() ops to return negative error code")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 kernel/dma/mapping.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 06fec5547e7c..49885023c223 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -249,12 +249,12 @@ EXPORT_SYMBOL(dma_map_sg_attrs);
  * Returns 0 on success or a negative error code on error. The following
  * error codes are supported with the given meaning:
  *
- *   -EINVAL - An invalid argument, unaligned access or other error
- *	       in usage. Will not succeed if retried.
- *   -ENOMEM - Insufficient resources (like memory or IOVA space) to
- *	       complete the mapping. Should succeed if retried later.
- *   -EIO    - Legacy error code with an unknown meaning. eg. this is
- *	       returned if a lower level call returned DMA_MAPPING_ERROR.
+ *   -EINVAL	An invalid argument, unaligned access or other error
+ *		in usage. Will not succeed if retried.
+ *   -ENOMEM	Insufficient resources (like memory or IOVA space) to
+ *		complete the mapping. Should succeed if retried later.
+ *   -EIO	Legacy error code with an unknown meaning. eg. this is
+ *		returned if a lower level call returned DMA_MAPPING_ERROR.
  */
 int dma_map_sgtable(struct device *dev, struct sg_table *sgt,
 		    enum dma_data_direction dir, unsigned long attrs)

base-commit: 9e1ff307c779ce1f0f810c7ecce3d95bbae40896
-- 
2.30.2

