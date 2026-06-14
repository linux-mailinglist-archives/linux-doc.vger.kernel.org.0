Return-Path: <linux-doc+bounces-92305-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ij1uJ1bKLmr/2gQAu9opvQ
	(envelope-from <linux-doc+bounces-92305-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 17:35:50 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A200681664
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 17:35:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TjQ3bxJD;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92305-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92305-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 92C3D3003634
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 15:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C181397690;
	Sun, 14 Jun 2026 15:35:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A698E3783AE
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 15:35:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781451342; cv=none; b=taYlLjaWrPMaXmSxjGmXABTaenTzqdc+NOyJrdUrm3vixsCD7I0sk8j1jRCKa6l+4gbeTpd7BAgEnN4bbR9vfhR9YMS/NGlqKeNQhGWhtqIoibnOhe96OTuFjk61kwUAfLITCkOnkH3wgMweYzTQOfJ0Rk28rDx0C5T95FU/Cs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781451342; c=relaxed/simple;
	bh=YipMZO8vcbHpc9Uwgtl34KMkub+gxp1VqBvE4Awkxbs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rurw0wDbHqbX149AnAToog2FkdG6fZM0AzJ/OqGdC/b2VLtKO4ON7AZC4mKs+HzE9O4ZnTjW4FBMEbXrggy1G1s47d1HJfr9t9pbTArIlA3tHLXzdnxsfTboLRdnQJx9lsllzwuJfwKSGF0dc/McUPK3nmDeuM09Cb1spRl0waE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjQ3bxJD; arc=none smtp.client-ip=74.125.82.173
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3074adb8fcaso3051005eec.0
        for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 08:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781451339; x=1782056139; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pR8769p891UZMpH2W/uEW47L6qds0Zm441UJr101ko0=;
        b=TjQ3bxJDzYcUOmMTJOpZ4H6fngnPEjLDNuLI/+pVANMM1nlcrXJ8IoeUXrUJ+biVMP
         zxb9+PZp42x6FWZ5PQDiHJPKBjXyELd+Ext7SQgYQ0Lvsaz7KGHLdlsLHJIBkW7zGsEI
         xdDDtQJWyzV9v4pQjgT2Z01P7EP63wZCTc2W5aSnysMBhftDkPQM0RgMERNZAmpOoeAA
         4Uq9wP3W8TNuIUnN1RG9ku2Mj8yVLoqsvqi62AEuILrYbeoZCdQC7Q8W8J6s96265KZO
         yH4IeFFZuSXNpJ798ItbVxDVyrVa3q4YEuSItXCXBwx9KAmowBXir22tevssOaiUOVaq
         OVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781451339; x=1782056139;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pR8769p891UZMpH2W/uEW47L6qds0Zm441UJr101ko0=;
        b=j61tXIO1PJShkQObZ+ihp5z2BtMZrn9DvasuFtLN8IM7/QEZGBdTwdVfta3qfVuc/c
         dJTjagsIHSPRiEXsIIzuGilf/Qylw7F8guO/q5ZxIAhBqY+oywqGJUp3Jwtx/x6vzUBX
         EMicOstvoqG/jOqOnL81yhPgGCjS/2fZ1g63bnWNtg45831yLhx0MJ6GQJcXC9Qzpjby
         k6SsxmuxFe+OmGi+YPVmybJZc1pXha+zsnuCfyxhXO8VEJNWbT2CNkvP+U1nqPYc1skL
         ytKZalp1ZzMuhn4S4ND9kH5qrguDJjCxJ4MuxwNO4p2SPDcvH6g6+bx/RAW4IdTyeKnj
         uwcQ==
X-Forwarded-Encrypted: i=1; AFNElJ8F60X5krSHGpYO+HS2dAq9EcuxjK+nQ0dOgta1tLKex8/zsoia1lLa6vuTrRURob3ThNlP+2pV+oE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmx3SPPNwpU8YwM5T+fv13Xan7dT1KL2xCHBApQ9nQD6yiRUuA
	mFVoDv+3viKM/K7RFMVxtvRM2sWSX8hmk7Hv9JBJKx2sP/5zl7GynRpr
X-Gm-Gg: Acq92OHfO6wcJD8531vP0j2e1MJYNeE7Oaiuxtd6w6mT40LSvReyi67c0uzDJNtT9wx
	yPdHRGTDMmWfeqNtqY2Tkb+F0NqAOnYiJZAO4Er7ZruOKHjyzMsS9hcHZE/aOdGqEgR7hke+hHx
	hrEK0/TNO2XHXvNJloX51DdFlLV+HdC0KFqxDabVnx4NE8BYEoRj3vS3K3Jl/+Xyua6MRkGzOpH
	TlOrypNJ+ucGNuwWVf7hmbSVad8+8pwrveOCtLAXuL+LtXBOYgCIPUR749CpzMQme6C8CBZSaBx
	OEmRHeUGBKTmXg3G9jHSg5ZTc4+h8qOyYFfgMgzQVnP88NpLdlOCbtFW9DQ08W/Xlinhzn336Qd
	V9BnZcuRRq45hzmOzEwhbbqGTMCpvRZ//4k9wex+VRBonIWsoER6fh/dsT9WPmfmtUzyrLFUKUY
	sDaBJD2byPfhIpSGMu3YD3HSxiX4GwuXF7jH2+mz0mdxXVAsr+708MBOjdfrxwAAMVT2NuXOQyt
	A==
X-Received: by 2002:a05:7301:9f0a:b0:304:dfae:68a with SMTP id 5a478bee46e88-30820213e52mr5158364eec.28.1781451338754;
        Sun, 14 Jun 2026 08:35:38 -0700 (PDT)
Received: from NV-J4GCB44.localdomain ([103.74.125.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0849sm12580632eec.7.2026.06.14.08.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 08:35:38 -0700 (PDT)
From: Jianyue Wu <wujianyue000@gmail.com>
Subject: [PATCH 0/3] mm/zram: route block swap I/O through swap_ops
Date: Sun, 14 Jun 2026 23:35:28 +0800
Message-Id: <20260614-zram-swap-ops-block-register-v1-0-6c1a6639c222@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEDKLmoC/x3MQQ7CIBAAwK80nN0EKJDqV0wPCyyVaEvDNmps+
 nfR41xmF0w1E4tLt4tKz8y5LA3q1Ilww2UiyLFZaKmddMrAp+IM/MIVysrgHyXcodKUeaMKqLw
 OfTRkkxOtWCul/P7317HZIxOEMs95+6WD0cmqSBjRGXMeTJ8GpXxCrcn2DqVCsiiDOI4vt8GwP
 6kAAAA=
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>, Chris Li <chrisl@kernel.org>, 
 Baoquan He <bhe@redhat.com>, Nhat Pham <nphamcs@gmail.com>, 
 Barry Song <baohua@kernel.org>, Kairui Song <kasong@tencent.com>, 
 Kemeng Shi <shikemeng@huaweicloud.com>, 
 Youngjun Park <youngjun.park@lge.com>, Minchan Kim <minchan@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-doc@vger.kernel.org, 
 Jianyue Wu <wujianyue000@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1781451334; l=2936;
 i=wujianyue000@gmail.com; s=id_ed25519; h=from:subject:message-id;
 bh=YipMZO8vcbHpc9Uwgtl34KMkub+gxp1VqBvE4Awkxbs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgW51Zh3v9nG0Wlld2Ti8ylp1TnO7yB
 H+z9CbXty/WEAQAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLdreTA16fucfMYtRCr0kKLCyUAAQoxuzmykekFWnqFYKkGLmaOZIoZGMb0x7xF17AyieFiOMQI
 NKjzX+rxzaQU=
X-Developer-Key: i=wujianyue000@gmail.com; a=openssh;
 fpr=SHA256:gVWBPJbHGWlCIw+V8F63Ff0k21S7AB5+rZt8+huemvg
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[huaweicloud.com:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92305-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FREEMAIL_CC(0.00)[lst.de,kernel.org,redhat.com,gmail.com,tencent.com,huaweicloud.com,lge.com,chromium.org,kernel.dk,infradead.org,suse.cz,kvack.org,vger.kernel.org];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:hch@lst.de,m:chrisl@kernel.org,m:bhe@redhat.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:youngjun.park@lge.com,m:minchan@kernel.org,m:senozhatsky@chromium.org,m:axboe@kernel.dk,m:willy@infradead.org,m:jack@suse.cz,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-doc@vger.kernel.org,m:wujianyue000@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wujianyue000@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wujianyue000@gmail.com,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c09:e001:a7::/64:c];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A200681664

This series builds on Christoph Hellwig's swap batching rework that
moves block swap onto struct swap_iocb and per-backend struct
swap_ops handlers [1].  Christoph's patches unify batching for
ordinary block devices and swap files.  zram still needs a custom
path because swap slots map to compressed pages, not disk sectors.

The first patch adds swap_register_block_ops() so a block driver can
install custom submit_read/submit_write handlers when swapon targets
its block device.  The default swap_bdev_ops path is unchanged for
devices that do not register.

The second patch registers zram_swap_ops at module init.  On write,
the swap core still batches folios into a swap_iocb.  zram maps each
folio to a slot index and stores it through zram_write_page() instead
of building one bio per page.  Read handling keeps slot_lock and
mark_slot_accessed() in one critical section.  Writeback-enabled zram
falls back to swap_bdev_submit_read() for ZRAM_WB slots.

The third patch moves slot_free_notify into swap_ops next to the
other zram swap callbacks, and documents the locking contract for
that hook.

Applied on top of Christoph Hellwig's "better block swap batching and
a different take on swap_ops" series [1].

[1] https://lore.kernel.org/linux-mm/?q=better+block+swap+batching

To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Chris Li <chrisl@kernel.org>
Cc: Baoquan He <bhe@redhat.com>
Cc: Nhat Pham <nphamcs@gmail.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Kairui Song <kasong@tencent.com>
Cc: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: Youngjun Park <youngjun.park@lge.com>
Cc: Minchan Kim <minchan@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Jan Kara <jack@suse.cz>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-block@vger.kernel.org
Cc: linux-doc@vger.kernel.org

Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
---
Jianyue Wu (3):
      mm/page_io: let block drivers register custom swap I/O ops
      mm/zram: handle swap read/write via swap_ops
      mm/swap: route slot free notifications through swap_ops

 Documentation/filesystems/locking.rst |   5 -
 drivers/block/zram/zram_drv.c         | 215 +++++++++++++++++++++++++++-------
 include/linux/blkdev.h                |   2 -
 include/linux/swap.h                  |  47 ++++++++
 mm/page_io.c                          | 187 ++++++++++++++++++++++++++++-
 mm/swap.h                             |  18 +--
 mm/swapfile.c                         |  17 +--
 rust/kernel/block/mq/gen_disk.rs      |   1 -
 8 files changed, 414 insertions(+), 78 deletions(-)
---
base-commit: 842f51deada6449843f811bfa22e536a01ae5a0c
change-id: 20260614-zram-swap-ops-block-register-a1b2c3d4e5f6

Best regards,
-- 
Jianyue Wu <wujianyue000@gmail.com>


