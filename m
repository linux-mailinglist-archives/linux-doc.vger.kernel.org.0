Return-Path: <linux-doc+bounces-87320-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qH2ULC9HBGp2GgIAu9opvQ
	(envelope-from <linux-doc+bounces-87320-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 11:41:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8842530D04
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 11:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4AFE7305432E
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 09:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7EB73E51FD;
	Wed, 13 May 2026 09:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="G4nyD1Pr"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77433E8688
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 09:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778664045; cv=none; b=pJxsRT5LwFhJE/jdHtBjWjD9oQ9zuXsdNvFP8Xf7JfKqNThtzc+96uz7aX2wHLoHiTa2Aw93g/9j3u/JLBVffwR69Sgq0uCgPhOzyhS8WVgj3tjIgygh02t6O1WYu2zrkU4WW4th/fAZ4EnwSLy+PKm+s1S3TTH1K82RfHxYCGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778664045; c=relaxed/simple;
	bh=Sv+JR1aGeL7VpxBUYQEz5vjPDK9PnJNOBpxT62UZ348=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X3yuOA0CWdHqDuMecAcX6NOeFy9Xm7NQPJKRc0Wfc2GWRgAYDsNctSKTKNzgG8NsUkJpLO+TwtaCqOcupZef/8cK5LsPCb6823qSAOlTSRwgSjHiF4tjfmeXvIDhljhklVf/5OEAfzMWHTLxFPOEjAYw8i9wVtsN+tYUdfJgkFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=G4nyD1Pr; arc=none smtp.client-ip=79.135.106.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1778664029; x=1778923229;
	bh=htjBDdNwXVb9k8aZRwnrOHi8Qta6rmdeLjangmCfvHU=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=G4nyD1PrVwh+zwkXiOhHwJUyJEAvpuu2XNSJhyo82TjvEmMBjgcI57JcWauGkRD1W
	 3ysCsbRJfPs2CTeyj2dGnIGHZaDS+gxu3LSljsx1zVnuK7lqL54C+nnDPkZ/qANd25
	 XYEGYvapO15SYWliqh5HYM1MDAKbCdgn2waRpdUMNlYvJ43apIPGSC6vNbft7EUsJT
	 K13GopyvUKG00lJ6LSUdnBMQnZVm7lSAITog+R18QYxYMuJcT+EUSYjbVR3mHLJCEg
	 XFU1lSYtKEmbTwEUUt0IhwSuIMRvLCULZ3pE5idTqKCqBFPsR1shNCahKWhcPU8G/o
	 GmKVhc/GiJryg==
X-Pm-Submission-Id: 4gFnxH0Fl3z2Scsm
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH] docs: update rust-analyzer command
Date: Wed, 13 May 2026 12:19:53 +0300
Message-ID: <20260513092017.265269-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C8842530D04
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.60 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[onurozkan.dev,quarantine];
	R_DKIM_ALLOW(-0.20)[onurozkan.dev:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87320-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linuxfoundation.org,linux.dev,hust.edu.cn,onurozkan.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[work@onurozkan.dev,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[onurozkan.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,zulipchat.com:url]
X-Rspamd-Action: no action

On a fresh checkout, generating rust-project.json alone is not enough
for rust-analyzer to work reliably. The issue only becomes apparent
later when the LSP fails on a proc macro or binding types/functions.

Recommend running prepare together with the rust-analyzer target so the
generated files expected by rust-analyzer are available from the start.

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/597064-rust-analyzer
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 Documentation/rust/quick-start.rst                    | 2 +-
 Documentation/translations/zh_CN/rust/quick-start.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index a6ec3fa94d33..df5b54b51deb 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -314,7 +314,7 @@ definition, and other features.
 ``rust-analyzer`` needs a configuration file, ``rust-project.json``, which
 can be generated by the ``rust-analyzer`` Make target::
 
-	make LLVM=1 rust-analyzer
+	make LLVM=1 prepare rust-analyzer
 
 
 Configuration
diff --git a/Documentation/translations/zh_CN/rust/quick-start.rst b/Documentation/translations/zh_CN/rust/quick-start.rst
index 5f0ece6411f5..3f7efd3a63ad 100644
--- a/Documentation/translations/zh_CN/rust/quick-start.rst
+++ b/Documentation/translations/zh_CN/rust/quick-start.rst
@@ -291,7 +291,7 @@ rust-analyzer
 ``rust-analyzer`` 需要一个配置文件， ``rust-project.json``, 它可以由 ``rust-analyzer``
 Make 目标生成::
 
-       make LLVM=1 rust-analyzer
+       make LLVM=1 prepare rust-analyzer
 
 
 配置
-- 
2.51.2


