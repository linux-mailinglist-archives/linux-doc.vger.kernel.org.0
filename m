Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 807C72E9DE
	for <lists+linux-doc@lfdr.de>; Thu, 30 May 2019 02:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727209AbfE3AxU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 29 May 2019 20:53:20 -0400
Received: from mail-pf1-f202.google.com ([209.85.210.202]:44833 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727193AbfE3AxU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 May 2019 20:53:20 -0400
Received: by mail-pf1-f202.google.com with SMTP id 5so3257736pff.11
        for <linux-doc@vger.kernel.org>; Wed, 29 May 2019 17:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=1zLLzunRacIsvbkfTaWpC4CoBmiOmCh3qurXkU7Ik8U=;
        b=h8FHABKxdlBN53cFTYJ5d0UiBL7PihQINuldUv4FTl0bNIxkuNBt/0Vhf2uJoL5oHc
         ntnxQeBd3+C8qEPYr5NVptJ+q35h8Vb6fgT/+ZS105INBTY18oRGfX0xwxo1L6VPNRA5
         c22OcQrAt10dKzRjCahiaTgdDbZ/vBceEd0fjRMjFH/6+q0u9FQKKJf/x+fsZdfIY04A
         Vc4TLPxz0LbwxUj10798jCsJzwt35n5zYTHpIofjFuIp+AqXXRE63vKbMXk1C/H9oUB6
         yHBPeUJEjTFKYiZzaX0gOwoHu4F0VQMZ+O+jfseDir1gYMx+VP4rwUkz9NYSSctfnSkb
         q/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=1zLLzunRacIsvbkfTaWpC4CoBmiOmCh3qurXkU7Ik8U=;
        b=bdSCTl21b/6p2JKl1jJoiYNv6i19G08OmMmg5RAtr+K5EGi9cqlsnNQDhWwfLjySFG
         VzPZdr3XlXl3XsOVolSPzRmZDjW8TqIbmpkga462Rqi4OSUztDf4UzUi9RuCjkUz5X0Y
         IXVbxFrngPOnnuRhfGL0YWjvJBj+mwmV+pfH1QVmuOOT6+BAaEol3W0Vqafq2O4RQr4F
         /ZTsWUpCAXKb7beelB75aZwvLxYagr8u7xRl0u68Ep/v1SrqApoSYdDbu8iTdXNTGurw
         ulQ/r2u1DvBAh8K09hDsKi9NbOdrxM1YaJ+Fmi90EsPXEEawakbBABCILE1mndM/1j+Y
         6TxA==
X-Gm-Message-State: APjAAAXvH3FxLbt8WiLofchRsjClUBqv+SfDibXLewQv6hxSzztiXxsb
        oD3A6/HUlQUbQHRYot9bP1Tao/cN8ho=
X-Google-Smtp-Source: APXvYqyldr1oA4bszRUF74gO+ABbvOdB1x8BeqSdaTU/ourXVmDB1Vf2L9oUISnK4Rb3ipD8ZuMVYmiiBMg=
X-Received: by 2002:a63:1622:: with SMTP id w34mr958542pgl.45.1559177599505;
 Wed, 29 May 2019 17:53:19 -0700 (PDT)
Date:   Wed, 29 May 2019 17:49:03 -0700
In-Reply-To: <20190530004906.261170-1-drosen@google.com>
Message-Id: <20190530004906.261170-2-drosen@google.com>
Mime-Version: 1.0
References: <20190530004906.261170-1-drosen@google.com>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
Subject: [PATCH v3 1/4] f2fs: Lower threshold for disable_cp_again
From:   Daniel Rosenberg <drosen@google.com>
To:     Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-f2fs-devel@lists.sourceforge.net
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, kernel-team@android.com,
        Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The existing threshold for allowable holes at checkpoint=disable time is
too high. The OVP space contains reserved segments, which are always in
the form of free segments. These must be subtracted from the OVP value.

The current threshold is meant to be the maximum value of holes of a
single type we can have and still guarantee that we can fill the disk
without failing to find space for a block of a given type.

If the disk is full, ignoring current reserved, which only helps us,
the amount of unused blocks is equal to the OVP area. Of that, there
are reserved segments, which must be free segments, and the rest of the
ovp area, which can come from either free segments or holes. The maximum
possible amount of holes is OVP-reserved.

Now, consider the disk when mounting with checkpoint=disable.
We must be able to fill all available free space with either data or
node blocks. When we start with checkpoint=disable, holes are locked to
their current type. Say we have H of one type of hole, and H+X of the
other. We can fill H of that space with arbitrary typed blocks via SSR.
For the remaining H+X blocks, we may not have any of a given block type
left at all. For instance, if we were to fill the disk entirely with
blocks of the type with fewer holes, the H+X blocks of the opposite type
would not be used. If H+X > OVP-reserved, there would be more holes than
could possibly exist, and we would have failed to find a suitable block
earlier on, leading to a crash in update_sit_entry.

If H+X <= OVP-reserved, then the holes end up effectively masked by the OVP
region in this case.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/f2fs/segment.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1a83115284b93..ec59cbd0e661d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -876,7 +876,9 @@ void f2fs_dirty_to_prefree(struct f2fs_sb_info *sbi)
 int f2fs_disable_cp_again(struct f2fs_sb_info *sbi)
 {
 	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
-	block_t ovp = overprovision_segments(sbi) << sbi->log_blocks_per_seg;
+	int ovp_hole_segs =
+		(overprovision_segments(sbi) - reserved_segments(sbi));
+	block_t ovp_holes = ovp_hole_segs << sbi->log_blocks_per_seg;
 	block_t holes[2] = {0, 0};	/* DATA and NODE */
 	struct seg_entry *se;
 	unsigned int segno;
@@ -891,10 +893,10 @@ int f2fs_disable_cp_again(struct f2fs_sb_info *sbi)
 	}
 	mutex_unlock(&dirty_i->seglist_lock);
 
-	if (holes[DATA] > ovp || holes[NODE] > ovp)
+	if (holes[DATA] > ovp_holes || holes[NODE] > ovp_holes)
 		return -EAGAIN;
 	if (is_sbi_flag_set(sbi, SBI_CP_DISABLED_QUICK) &&
-		dirty_segments(sbi) > overprovision_segments(sbi))
+		dirty_segments(sbi) > ovp_hole_segs)
 		return -EAGAIN;
 	return 0;
 }
-- 
2.22.0.rc1.257.g3120a18244-goog

