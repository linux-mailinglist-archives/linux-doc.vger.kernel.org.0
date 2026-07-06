Return-Path: <linux-doc+bounces-95165-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c3USK8PSS2q4awEAu9opvQ
	(envelope-from <linux-doc+bounces-95165-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 18:07:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BE5713042
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 18:07:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=j90S+7Ef;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95165-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95165-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3029C3051EE9
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 15:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB491381EA7;
	Mon,  6 Jul 2026 15:14:14 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A95381B0D
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 15:14:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350854; cv=none; b=agnZvQLY60a5YmSUwpWM95Hf+W2rZo5AetKTcpINkLBsNZCjuWDYKuK0MQpTjXfrftsDgLgQH+RaAgc79BufUFbaUzY5NiHx9I/zwXlT7jKbCRSIXIlqT4UcOl4We+Q3mpv1XXhnvR+xK5p1Tzz+66j5OuOwx5CCFKkop0eRfhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350854; c=relaxed/simple;
	bh=GzRlC8RUZDDXV0uMxI+zkFGe/N/LUOCv4WqEJ2e+kEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lcH62qCWMXDQ66or5prBvjLB5btEWGdP18+MlXr1c5HxU0YjI8CcCSlS/Q3W+fUL93KrwHVB/nu2zylbDC75FYS7ej98lJHmuFrw7qI+RIT9NXSzm/l6Bqt74Q7rNmr5xFON05xcWg7fFPuhCQEhJ8Sh96m3YMPnN1yYrFKpqdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j90S+7Ef; arc=none smtp.client-ip=74.125.228.1
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-c8c1ebd68a1so464988a12.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 08:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783350853; x=1783955653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wtuBqAT0bambetP4U9wPZ1GCkR4NVGjErdKPI57fLGI=;
        b=j90S+7EfpgXjovI5eQy/80xYS1vvTA/Lu0DBMe5m7rcuKprNRB4s98lrWzjGVU22YB
         AAMCCRhtGVdbl5wwJxzLHL/Vr42GF0PlqitoeX/3b3ShjxRCqG4VYGqYH0THzS6+pjJK
         kC1CAXPN4+7DITJb+wWXhGdaRKS5/VQVLN/3ybx++mXM/DTeroMGchrOwqHS0LDrURl6
         ao0IUqC39G0AoXqUdFQftFFfevSnz67t0T1d+pmdcaCPPJclD/p22g0JziKPwEIVly3j
         wpKmZRITKnsAGzB7JVLHWN8hi8jPidSnKsyltRgzJxgqWb1vDCfxX13Ku2CYwwUmcp8g
         V0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350853; x=1783955653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtuBqAT0bambetP4U9wPZ1GCkR4NVGjErdKPI57fLGI=;
        b=a/9ydbgNHBWKFsZBpG/JXDyWZTwvUlNvks1RkNCdOIenKNSbYb8KnA9RaosjKh4AfT
         iPw2FIQ+TQuMEacnDBeG58T+6/bD9voI45yhLOmKtJiR+jif2nK1kOguovpvbaLTcdhg
         qASnudiXElvTGCNWwB6kAu3FLGuw4+RIGkgCtzxHU+W5tEB7j8Q+a79QhcqsOc0W018b
         jhUPmX+LlQtv03GcNXOm0JWLIEHgQN4Uw5mAi8vOF3WsnRdfJtLVjp8MFIsUfrZbWMO0
         QsSntM0qIPr1P7m9azo77H+FkeVxmW/jjSMfy4Ll1FeUOX9g+leIMGjgr4T1e0h8OGZW
         dSXA==
X-Forwarded-Encrypted: i=1; AHgh+RpRcZF/hyrIJuy97So3/vbZ6zaAK1R2jlw2TvqDSck/pcsBOvN1gkLRbWcLa2dFZJzfv6Kl4g54kj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsBfcwEu+AXNEmOg+LoczM9NIRR+fAzVQ+jst55+Rh10UNGcz1
	aTHtrZaOzy1USmaYsK565BI2DLqZ/iz37rxsC//BQQQ0Fs6ndLyPX2oU
X-Gm-Gg: AfdE7clzw7Ot9l4Iliw0uQInMN3WKGl3ReuFIXckAWPim0tycQX8xJMIwAAuhI6LBtF
	TU52I8HeFLQ078FPG8IT9x8dO/zj9l7cNMNXE1bAc1sSqdJnad62YjTIkt1lbRsyU675fIOaWEN
	XDZ5lLnxQcfM5QiRvyqjoGIX4iUMPnRUugnJ/sTtuoDp3OoYpIrxZs5Xa6An0j3EqC6bhc2Q6zT
	CkekggFPIXnW17axi5XlcDVCyc7Nqy6kM2IJuXeV1pJ7B8i25sbERZk6L8I5rEKqBL6uSmdmNVH
	alxw9qUcdj7EuLCuq4bHnryJ29pAOiVDZ22TBmDQrqdYRvKPlAYnPBp088nq+goyDezvQjbgzw9
	eRpdndf7EonvkDKARFbarvZzJ84frxt4pW3wOsNQ1VCEnjbn4+5O/tHzAEAdInvILesoENPyMFY
	y5EI5XaGyVKEIxPcG+KdmL
X-Received: by 2002:a05:6a00:2916:b0:847:8ccc:d7cd with SMTP id d2e1a72fcca58-84826d1cbddmr967094b3a.37.1783350852113;
        Mon, 06 Jul 2026 08:14:12 -0700 (PDT)
Received: from archlinux ([2409:8a4c:cc0:9ab1:cd4b:250d:9228:2c4d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d44d53sm3994083b3a.38.2026.07.06.08.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:14:11 -0700 (PDT)
From: Jiandong Qiu <qiujiandong1998@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiandong Qiu <qiujiandong1998@gmail.com>
Subject: [PATCH v3 0/2] docs/zh_CN: update translation of doc-guide/sphinx.rst
Date: Mon,  6 Jul 2026 23:13:51 +0800
Message-ID: <20260706151358.2103703-1-qiujiandong1998@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[hust.edu.cn,lwn.net,linuxfoundation.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95165-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexs@kernel.org,m:si.yanteng@linux.dev,m:dzm91@hust.edu.cn,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiujiandong1998@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[qiujiandong1998@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiujiandong1998@gmail.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1BE5713042

Hi all,

This series refreshes the translation of doc-guide/sphinx.rst. 
Since the updated version refers to process/changes.rst, I also add 
the missing zh_CN translation for that file to ensure a consistent 
reading experience.

Changes in v2 -> v3:
- sync changes.rst with the latest commit.
Changes in v1 -> v2:
- drop the separate llvm.rst anchor patch
- remove the `_sphinxdoc_zh` anchor from .../zh_CN/doc-guide/sphinx.rst
- add Assisted-by tags

Link: https://lore.kernel.org/linux-doc/20260619140245.1982921-1-qiujiandong1998@gmail.com/ # v1
Link: https://lore.kernel.org/linux-doc/20260621131215.1303439-1-qiujiandong1998@gmail.com/ # v2

Jiandong Qiu (2):
  docs/zh_CN: add process/changes.rst translation
  docs/zh_CN: update sphinx.rst translation

 .../translations/zh_CN/doc-guide/sphinx.rst   | 167 ++++--
 .../translations/zh_CN/process/changes.rst    | 533 ++++++++++++++++++
 2 files changed, 666 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/process/changes.rst

-- 
Jiandong Qiu <qiujiandong1998@gmail.com>


