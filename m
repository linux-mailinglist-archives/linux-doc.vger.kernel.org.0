Return-Path: <linux-doc+bounces-26693-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA02993616
	for <lists+linux-doc@lfdr.de>; Mon,  7 Oct 2024 20:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62615286C09
	for <lists+linux-doc@lfdr.de>; Mon,  7 Oct 2024 18:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5974F1DE2BE;
	Mon,  7 Oct 2024 18:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="W0ADNFCB"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f97.google.com (mail-wm1-f97.google.com [209.85.128.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6651DDC2D
	for <linux-doc@vger.kernel.org>; Mon,  7 Oct 2024 18:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728325477; cv=none; b=m3p2n6imZRnbmx2Wjc5CrLxhEdEZALwXQtEtE/2zNb6YaaOYDJw9IZ9yeOGSPs2D4cSRGMPy2CltzwSM8MPIaNpKGyaqXeeIjNb2YG7m2e9TkG/F74XFW+2vqRs7mB6Bp6gyfP4g4OgjgR0FA/8GOVNcE8KgEdoAtiMTkBThmM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728325477; c=relaxed/simple;
	bh=QZBCwy/lD0XW0UevSXfq144qRLCxHg+wAUyu0q5BGR4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nKIZjLdGAFjrycN8wylan3rdNVBgEyJPVa/P4o3Ucai6eKPxff3mM2OvRdKfxSOJQ4rwzScSrZYVWw43EnxFnFSxLJwAMrL+473s85fAmOX2xNzEsw4onmK/tnoJOGCcwbI1ttDwsLF/qYSV+M4YYTyFEUo26J+04cDS0t9EQe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=W0ADNFCB; arc=none smtp.client-ip=209.85.128.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Received: by mail-wm1-f97.google.com with SMTP id 5b1f17b1804b1-42cba6cdf32so48254045e9.1
        for <linux-doc@vger.kernel.org>; Mon, 07 Oct 2024 11:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1728325474; x=1728930274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yH/L8ILWxKtxaV/Gz8pZ/T+h8pPYEsO/DmxFNXaNNo=;
        b=W0ADNFCBRqKFEQ0GVJXJeKn9BwxC+1AftEi9+q3i4xNHEcQpHcaEyBkXzlcrke9Oi5
         cWkS4/4eRIOcfZkhoHUg9QeuokHxg6KXs28N0kQKqmI4YomG88ys0J55NlB1nXjw36S7
         Ji/tuT9b3rMg7DFoclUHAYV2d2dis9jxV4tnBdVoUqbP8W64bnAEQfEYJ+sMo0OMpwN/
         YAc310GtwoAPBU1+SUb++WRErjAQO09oNsJVgZCPt8plWsVlABe1kGc0S7zowAaQYakn
         W3DbmNlYHAUDN1cgOG1riOgkUq0XJXPP9FHP6FGYjeY0oxhmu2gYJsP3+oS554mjbTLg
         V+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728325474; x=1728930274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9yH/L8ILWxKtxaV/Gz8pZ/T+h8pPYEsO/DmxFNXaNNo=;
        b=NM11WS2T6T5s6BX9aTXhdlEMj1mBt/Hd12N3d8nzp6KLvAFFKWjGK5ikgm5Cf0//YB
         5v+1y5eTTjf9oX3YGvAa/fNJnpYFo9kHhMDuONxwDbNobAlCHRrVZl3sgmBx3rj7wnL2
         wTsIY3clLjf53oqLjXU9efY5FWQbI5cJgomHtSo5i/ZKe4o4OT6EKf0bMBprDtrM4nzf
         5BOD0yDaXFFgImr/mfRcnYp9wUACFwSDbwKDvLkED2eXeR8ZEylkOWrNGgJWDmTgYM9U
         Mq1lHWm50OAODRELuOpdCCBmShO3eSx17HJxS5/Y/O4HIZvtZAKxgxckWZIHNKsni89X
         LqUw==
X-Forwarded-Encrypted: i=1; AJvYcCWp15Z3fUUgQJ003PxTPqdkkt1aVEa8GLVpQ93+Y9qdCWMU0pLIZfoNHfMoWMyuLDyXgBMhYG/vyew=@vger.kernel.org
X-Gm-Message-State: AOJu0YyId2g9cTa+aWo7qMt9m4tOrVzaWyfJB5y8AaUQLDMUZXBWwLdw
	8v22qJqlerENzL1+TWikkd+k3mUEvaGIuhghuWhE2I6PulvK+57YanEv5vrUfZd7Ne8EvcfzQ6x
	kplY82nHDQNFkiyDkUhxG36BYKP/GJhsR
X-Google-Smtp-Source: AGHT+IGvRWZfNrgX4t5z6ZPb+UcA+5iXc9bUSxiSGrmAutwO/10Mra5K2+QfutcihWPdi+Yzu5wTLx2LtBgX
X-Received: by 2002:a05:600c:8718:b0:42c:bd5a:9479 with SMTP id 5b1f17b1804b1-42f85ab8e77mr98408525e9.18.1728325473618;
        Mon, 07 Oct 2024 11:24:33 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-42f89e85d85sm1906765e9.8.2024.10.07.11.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:24:33 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 4E088341809;
	Mon,  7 Oct 2024 12:24:30 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 4B995E41358; Mon,  7 Oct 2024 12:24:30 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 5/5] Documentation: ublk: document UBLK_F_USER_RECOVERY_FAIL_IO
Date: Mon,  7 Oct 2024 12:24:18 -0600
Message-Id: <20241007182419.3263186-6-ushankar@purestorage.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007182419.3263186-1-ushankar@purestorage.com>
References: <20241007182419.3263186-1-ushankar@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
 Documentation/block/ublk.rst | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/Documentation/block/ublk.rst b/Documentation/block/ublk.rst
index ff74b3ec4a98..51665a3e6a50 100644
--- a/Documentation/block/ublk.rst
+++ b/Documentation/block/ublk.rst
@@ -199,24 +199,36 @@ managing and controlling ublk devices with help of several control commands:
 
 - user recovery feature description
 
-  Two new features are added for user recovery: ``UBLK_F_USER_RECOVERY`` and
-  ``UBLK_F_USER_RECOVERY_REISSUE``.
-
-  With ``UBLK_F_USER_RECOVERY`` set, after one ubq_daemon(ublk server's io
+  Three new features are added for user recovery: ``UBLK_F_USER_RECOVERY``,
+  ``UBLK_F_USER_RECOVERY_REISSUE``, and ``UBLK_F_USER_RECOVERY_FAIL_IO``. To
+  enable recovery of ublk devices after the ublk server exits, the ublk server
+  should specify the ``UBLK_F_USER_RECOVERY`` flag when creating the device. The
+  ublk server may additionally specify at most one of
+  ``UBLK_F_USER_RECOVERY_REISSUE`` and ``UBLK_F_USER_RECOVERY_FAIL_IO`` to
+  modify how I/O is handled while the ublk server is dying/dead (this is called
+  the ``nosrv`` case in the driver code).
+
+  With just ``UBLK_F_USER_RECOVERY`` set, after one ubq_daemon(ublk server's io
   handler) is dying, ublk does not delete ``/dev/ublkb*`` during the whole
   recovery stage and ublk device ID is kept. It is ublk server's
   responsibility to recover the device context by its own knowledge.
   Requests which have not been issued to userspace are requeued. Requests
   which have been issued to userspace are aborted.
 
-  With ``UBLK_F_USER_RECOVERY_REISSUE`` set, after one ubq_daemon(ublk
-  server's io handler) is dying, contrary to ``UBLK_F_USER_RECOVERY``,
+  With ``UBLK_F_USER_RECOVERY_REISSUE`` additionally set, after one ubq_daemon
+  (ublk server's io handler) is dying, contrary to ``UBLK_F_USER_RECOVERY``,
   requests which have been issued to userspace are requeued and will be
   re-issued to the new process after handling ``UBLK_CMD_END_USER_RECOVERY``.
   ``UBLK_F_USER_RECOVERY_REISSUE`` is designed for backends who tolerate
   double-write since the driver may issue the same I/O request twice. It
   might be useful to a read-only FS or a VM backend.
 
+  With ``UBLK_F_USER_RECOVERY_FAIL_IO`` additionally set, after the ublk server
+  exits, requests which have issued to userspace are failed, as are any
+  subsequently issued requests. Applications continuously issuing I/O against
+  devices with this flag set will see a stream of I/O errors until a new ublk
+  server recovers the device.
+
 Unprivileged ublk device is supported by passing ``UBLK_F_UNPRIVILEGED_DEV``.
 Once the flag is set, all control commands can be sent by unprivileged
 user. Except for command of ``UBLK_CMD_ADD_DEV``, permission check on
-- 
2.34.1


