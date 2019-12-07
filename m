Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 289A2115AC8
	for <lists+linux-doc@lfdr.de>; Sat,  7 Dec 2019 03:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbfLGCz1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 6 Dec 2019 21:55:27 -0500
Received: from sonic306-21.consmr.mail.gq1.yahoo.com ([98.137.68.84]:38796
        "EHLO sonic306-21.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726386AbfLGCz1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Dec 2019 21:55:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1575687325; bh=fnUCfRD5mVXcUGhv6/aWxu50QM2W69ZxDy9DcMMOV2k=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject; b=ixek0n5KeJzh5UAc+SLd+mznYZAfoqdZZM33wtIvcC2DYeBC6InbfgiMX93RYEsYWoczHdf6CY7fzZJnep2jBQotg3s7Jy6rbaHk2sQGsVdWICO5B4rhPePjhsrePQ4ah58pyotMqIqIPAVGG4NQquzxUH13xkbA3SwqCH007Tm/LrdMaVyw3HgN/4QBpfBtoAw1coIihuOrXNHup3DC569xtZ2+rqFIqlREVTW1UEL/bZMMxrmk8Cv7x84MTXDk9d3v6dAKQloZjEQaaSrgrwKGn1Gkj7Q9L8GpBZxL46NB7ewVPvmwFti/B5DMFHpJ9E5ipcTNbArCeffK+T9cpA==
X-YMail-OSG: OnijvzAVM1mCIHcj2U.Ap9QvIggy1hepCdbynRqBQGOf1kME.7hUyGdC_2eP7Yg
 rCjF8O8e785m8dfSrs77lovyvxQYCA4sqJhUNikZMsng0ZCw4fA9FsQL.GqPfQl5Iy.o2ETO.Pg0
 1zH3VLThioe.BsnOZ7SgvJPKwcTiWFLJBPFVQckab3Ok1fTwFUlqAreIvVF8W0dnUwA0FocuO7_s
 9njN4py2z3hn87AIjZww_8fro745LOotcJ1saVFTNC6JSU.RiXFxdiMuKiEnbcARTwrt4w3Ib1tv
 hAL3__WcPRYtNc_aRYrZTqn8VqjxzJzqjJEf5vemDb1qh24uXtMHYUf8CpFm0hjsoXKud8LF_kBp
 zB8sa.UzWF2O6lYkCMu8cWaM8AxHDZUjc0Cz6YML9Nxkx6roF3mEQRIxBaryWqFqEKLLmgMVEC9G
 tF8P2CpLy7RtjMtQHZQxgN74IO_yvgrbK3x7fVWM9gWgvTr68hP4vocuD6otguVVa0aRs3fNOTu1
 325tQs4IvwsaurwUZbg32xTSzibPyBcS8lklaVBteEio8eQoc0RMlf2kRDB0J0KuBOGtox3pJdAa
 T0vMeSWLU4HQ1C6fkvwKXHYOaBD93jenwHxpyh2URT1wlo4vSNIj01LwCyIT0XonbJ5oTaxqNn8J
 Hd.wo2bYsKDIQuzzSWcmo6plp40IbdEdNFl4515gXDtYZK8PmKs76RI7kbTVmOnlQ9M0aHxR_Aw0
 IUaFhdpue6Ul4bB6qa6ooot4iDprGbpkyDS8foDEaByFykLc7pwveRXwKqPirjsXrOw_atYMBapD
 VuOH0swjbVWdH.Rm1PtvDyUxQ.UHfPKy3CqqyqgGP0XFX6kjY.wBhJCpBr4S6H_.8Kl38KPTycJe
 nucqeZDQ67y3NO6HuHVVvBNI9u7rdDDjMVsqzq3t5t8oJQEnRd1XXd3egaxI_cHzFgloCRN8XxBy
 gKnv_SiNzEVY8LESNlBAmq8z_3KubTc56qtTfZ34HVOnpCHAPUTxqjK2EJvMFI0CibA6eMTQK4uy
 pMVyw7fOaPrfzqbtuyFe38w2BLsdJFeQbz_fi76qUfv2S2uduHzRjwNTymtSCDC7iIwNtFV0iu9B
 Ap1QvprEc_nsb_ckWhYcwfNbeYm7Ql5kv._Q5OxDWXZgPFha7leXJYZ14Gx1BRfXD7SD9L5gzoSg
 0j7AIUurlFXO.tR7NAaiLz0ejhwqjEF1Gytm0EI2bZ35aviDz7LiBSdQed._RmPpe9moPczBQHh2
 zOmu.DvYLJ2Y.wKTBYqsFe_ffJ71V6RQN.qJlgJ1v9.MqF1jyjRFCzNNGPveH_O7RIdppusdyuAh
 8oPP0uCAXo1OlAh1JvevYm2pwgvjQUovFUxOv9jq6sXFiYAoTL5DT4NBfP.6q8Iw0bfAy4H5OqeQ
 u9AA-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.gq1.yahoo.com with HTTP; Sat, 7 Dec 2019 02:55:25 +0000
Received: by smtp432.mail.ir2.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 2399de470237d8d6426da1f13fa9f534;
          Sat, 07 Dec 2019 02:55:21 +0000 (UTC)
From:   Gao Xiang <hsiangkao@aol.com>
To:     Chao Yu <chao@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-erofs@lists.ozlabs.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gao Xiang <gaoxiang25@huawei.com>
Subject: [PATCH v2] erofs: update documentation
Date:   Sat,  7 Dec 2019 10:55:09 +0800
Message-Id: <20191207025509.6614-1-hsiangkao@aol.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207023726.5359-1-hsiangkao@aol.com>
References: <20191207023726.5359-1-hsiangkao@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Gao Xiang <gaoxiang25@huawei.com>

Some on-disk structures, fields have been renamed in v5.4,
the corresponding document should be updated as well.

Also fix misrespresentation of file time and words about
fixed-sized output compression, data inline, etc.

Signed-off-by: Gao Xiang <gaoxiang25@huawei.com>
---
changes since v1:
 - mark that "fixed-sized output compression (with compacted indexes)"
   was firstly introduced in v5.3 in order to minimumize metadata;
 - reduce whitespace between on-disk values and words about data mapping
   details;

 Documentation/filesystems/erofs.txt | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/Documentation/filesystems/erofs.txt b/Documentation/filesystems/erofs.txt
index b0c085326e2e..db6d39c3ae71 100644
--- a/Documentation/filesystems/erofs.txt
+++ b/Documentation/filesystems/erofs.txt
@@ -24,11 +24,11 @@ Here is the main features of EROFS:
  - Metadata & data could be mixed by design;
 
  - 2 inode versions for different requirements:
-                          v1            v2
+                          compact (v1)  extended (v2)
    Inode metadata size:   32 bytes      64 bytes
    Max file size:         4 GB          16 EB (also limited by max. vol size)
    Max uids/gids:         65536         4294967296
-   File creation time:    no            yes (64 + 32-bit timestamp)
+   File change time:      no            yes (64 + 32-bit timestamp)
    Max hardlinks:         65536         4294967296
    Metadata reserved:     4 bytes       14 bytes
 
@@ -39,7 +39,7 @@ Here is the main features of EROFS:
  - Support POSIX.1e ACLs by using xattrs;
 
  - Support transparent file compression as an option:
-   LZ4 algorithm with 4 KB fixed-output compression for high performance;
+   LZ4 algorithm with 4 KB fixed-sized output compression for high performance.
 
 The following git tree provides the file system user-space tools under
 development (ex, formatting tool mkfs.erofs):
@@ -85,7 +85,7 @@ All data areas should be aligned with the block size, but metadata areas
 may not. All metadatas can be now observed in two different spaces (views):
  1. Inode metadata space
     Each valid inode should be aligned with an inode slot, which is a fixed
-    value (32 bytes) and designed to be kept in line with v1 inode size.
+    value (32 bytes) and designed to be kept in line with compact inode size.
 
     Each inode can be directly found with the following formula:
          inode offset = meta_blkaddr * block_size + 32 * nid
@@ -117,10 +117,10 @@ may not. All metadatas can be now observed in two different spaces (views):
                                                        |-> aligned with 4B
 
     Inode could be 32 or 64 bytes, which can be distinguished from a common
-    field which all inode versions have -- i_advise:
+    field which all inode versions have -- i_format:
 
         __________________               __________________
-       |     i_advise     |             |     i_advise     |
+       |     i_format     |             |     i_format     |
        |__________________|             |__________________|
        |        ...       |             |        ...       |
        |                  |             |                  |
@@ -129,12 +129,13 @@ may not. All metadatas can be now observed in two different spaces (views):
                                         |__________________| 64 bytes
 
     Xattrs, extents, data inline are followed by the corresponding inode with
-    proper alignes, and they could be optional for different data mappings,
-    _currently_ there are totally 3 valid data mappings supported:
+    proper alignment, and they could be optional for different data mappings.
+    _currently_ total 4 valid data mappings are supported:
 
-     1) flat file data without data inline (no extent);
-     2) fixed-output size data compression (must have extents);
-     3) flat file data with tail-end data inline (no extent);
+     0  flat file data without data inline (no extent);
+     1  fixed-sized output data compression (with non-compacted indexes);
+     2  flat file data with tail packing data inline (no extent);
+     3  fixed-sized output data compression (with compacted indexes, v5.3+).
 
     The size of the optional xattrs is indicated by i_xattr_count in inode
     header. Large xattrs or xattrs shared by many different files can be
@@ -182,8 +183,8 @@ introduce another on-disk field at all.
 
 Compression
 -----------
-Currently, EROFS supports 4KB fixed-output clustersize transparent file
-compression, as illustrated below:
+Currently, EROFS supports 4KB fixed-sized output transparent file compression,
+as illustrated below:
 
          |---- Variant-Length Extent ----|-------- VLE --------|----- VLE -----
          clusterofs                      clusterofs            clusterofs
-- 
2.20.1

