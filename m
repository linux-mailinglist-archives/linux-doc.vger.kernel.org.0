Return-Path: <linux-doc+bounces-82991-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OI9hImpj2GlDcwgAu9opvQ
	(envelope-from <linux-doc+bounces-82991-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Apr 2026 04:41:46 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B99413D180E
	for <lists+linux-doc@lfdr.de>; Fri, 10 Apr 2026 04:41:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F172300C91D
	for <lists+linux-doc@lfdr.de>; Fri, 10 Apr 2026 02:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD492E7F0A;
	Fri, 10 Apr 2026 02:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="choqYw1k"
X-Original-To: linux-doc@vger.kernel.org
Received: from va-2-29.ptr.blmpb.com (va-2-29.ptr.blmpb.com [209.127.231.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E311DED49
	for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 02:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775788903; cv=none; b=LdMTwKTc/lpoQEkbsqve1veiqFdwmZ15o5o05yxZyrsgVtBIOr4ornsj2P8neCWweMMvaXPb9uY4cp6/FZoCyEWP+5uBzsQ78TjeIM6jW8IupVYuYLTy9ZJ+hccbYbLOj4FsgekIdHMCs2Xk6Rk3XSQ6/kFn63CVm6r1VBMTZoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775788903; c=relaxed/simple;
	bh=kyvMBj2w3qj/B4QU4Whnoyt1NoHMtskZKE/MEG25BjI=;
	h=From:Date:Content-Type:Cc:Mime-Version:Subject:Message-Id:To; b=LOD39Ma1eT3QP+lVKiFub1GFHKMmhLSrCkMgpeDQFCOBPvqeOS1M3quLLEi9+GJC3hw9gP8rSW+EsmQyAASeeH6pYBdtu9cK+Ar62PDWmbhsD/c/CsFAD84xNB8k4UIKWf0RbERY1D+hW5K2DQRi8/r4hsZGFEr/67zO8mGcAI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=choqYw1k; arc=none smtp.client-ip=209.127.231.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1775788889;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=kOuxvbSd64E7NtEVxELYZAuxAUoKF1DXYFRvgI5oU/w=;
 b=choqYw1kgisjvu6zW1DwQJZqcSszi3RDolVyiMTutX9gOet467t5CIb0FvoHIN9nXs65XU
 Kn4eo00JheBQO/0eyLN/C5ImxF+dd0uwWwYoRtLMLltXeZLx/SmvbQCluztGcJbcO+dRZ6
 lxi9tdg0oTGkdGa3zaPWbnRU+IqhrwKmH6B7Mdso61g2sQl7w7nm54mXFSgZkf4NC+x1/S
 MHrwFRieokafOiFGCcAaIuvG1BZ39GyrQD9GvGPi+ILYuHJzgSdpF2MDFzNNg4fNZ01VeT
 RwNCw5CzJRWcWPtNbfXDe3wRbVCUt+p0A/uXL5NuVC3dsWRNS2dL8JtPssA+Wg==
From: "Ben Guo" <ben.guo@openatom.club>
Date: Fri, 10 Apr 2026 10:41:09 +0800
Received: from localhost ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Fri, 10 Apr 2026 10:41:27 +0800
Content-Type: text/plain; charset=UTF-8
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<rust-for-linux@vger.kernel.org>, 
	<hust-os-kernel-patches@googlegroups.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: [PATCH v2 0/4] docs/zh_CN: update rust/ subsystem translations
Message-Id: <cover.1775786987.git.ben.guo@openatom.club>
X-Original-From: Ben Guo <ben.guo@openatom.club>
X-Mailer: git-send-email 2.53.0
To: "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+269d86358+8e87b7+vger.kernel.org+ben.guo@openatom.club>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[openatom-club.20200927.dkim.feishu.cn:s=s1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[openatom.club];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-82991-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.guo@openatom.club,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[openatom-club.20200927.dkim.feishu.cn:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B99413D180E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update Chinese translations for the Rust subsystem documentation,
syncing with the latest upstream changes.

- arch-support.rst: add ARM (ARMv7) support, update RISC-V and UM notes
- coding-guidelines.rst: add imports formatting, private item docs,
  C FFI types, and Lints sections
- quick-start.rst: add distro-specific install instructions, update
  rustc/bindgen sections, remove cargo section
- index.rst: remove experimental notice and genindex

Changes in v2:
- Add Reviewed-by from Gary Guo

Ben Guo (4):
  docs/zh_CN: update rust/arch-support.rst translation
  docs/zh_CN: update rust/coding-guidelines.rst translation
  docs/zh_CN: update rust/quick-start.rst translation
  docs/zh_CN: update rust/index.rst translation

 .../translations/zh_CN/rust/arch-support.rst  |   9 +-
 .../zh_CN/rust/coding-guidelines.rst          | 262 +++++++++++++++++-
 .../translations/zh_CN/rust/index.rst         |  17 --
 .../translations/zh_CN/rust/quick-start.rst   | 190 ++++++++++---
 4 files changed, 401 insertions(+), 77 deletions(-)

-- 
2.53.0

