Return-Path: <linux-doc+bounces-96454-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QYn+F81wU2qsawMAu9opvQ
	(envelope-from <linux-doc+bounces-96454-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 12:47:41 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C08927446AF
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 12:47:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=OuWrgPEM;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96454-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96454-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A8793013270
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 10:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580C73749ED;
	Sun, 12 Jul 2026 10:46:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D7E1925BC;
	Sun, 12 Jul 2026 10:46:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783853164; cv=none; b=XPYOIninxYBaY++d5w1QO7n0OZV1GUNhHiIclF3w+17nBab9QOUTENJLfzFYStk5vMTqh4nT1eWL7wUladE0Q1jGzh0fsG3ADz9i2//jUZNNMXOwC0tBac3jQ8F9sMBzGTtAVtInNtrSEhdVrr4U+35lNSvuNiBpjJk8+/4VjEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783853164; c=relaxed/simple;
	bh=HaWCVERoRq2AA5EvK5SjC4HIhI5tbIzi0oOykG/xBMw=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=RKroXurxC2KvfUfM8TtO9SX0cZRhD6Ne34TRkDhGD5uetrRIyjec3wjrC2fJRYhSyrcJ8Ni5v2t2Inr+Uw3Jg6jWfEb9Z982kr906g16fyDSkcKG3SHw5qNk2kXmx0/gJF5cxTEjycNvX+vxsOmxQUGYmSetiJ8BxqaqHFij5zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OuWrgPEM; arc=none smtp.client-ip=80.241.56.171
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gyj0P45qQzMlGQ;
	Sun, 12 Jul 2026 12:45:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783853157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GcPKYfGjX+0DSaOR/OjGNIz04gXSzzPUKL3t2tQNdEg=;
	b=OuWrgPEMWC0Z/ooU10kXLcW0cJGxdFqzqLjJEsAOBxjP2V0lbeGqQ9gbYv9ZY4nmv1yCb5
	dv5OkDMjLElMCp9lzxyUGzYXBwljBYIXHP6Md1Yu1owzAMT+v7JET4ZlCHizI7+E+X7qPf
	I2He0iWVtw1a/5CEdtORVPmRd/T1+YjZNA1ez2smKxNRUyL1uOMa24kuNxWBT1LF/6Gdoz
	QxU+jKo+e6ZYcIuCiiO4pQKI6IxpFbr+o3I6GgNZ6FrooVNlx8xiwP3ej1Mtp+e/x1kY9N
	ayqFUxMKkClRkmFM8ofEKluoZ4Hre+xqPylCcfWRiUMLYtwNlM+Ugl1Z8GXvVA==
Message-ID: <98a558a87a07ab641f47c66c372ee7ed0735f4f5.camel@mailbox.org>
Subject: [Issue] maintainer-handbooks: html: list has duplicates
From: Manuel Ebner <manuelebner@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org
Date: Sun, 12 Jul 2026 12:45:53 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 0daaf726eff926e7231
X-MBO-RS-META: g5jufyd1o8f1apdb7in4efwbxc5fcf9t
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:workflows@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-96454-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:from_mime,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C08927446AF

Hi,

I was reading documentation when I stumbled across this. There's a lot of
repetition in the list at: https://docs.kernel.org/process/maintainer-handb=
ooks.html

See below.

Thanks
 Manuel

> [...]
> For maintainers, consider documenting additional requirements and expecta=
tions if submissions
> routinely overlook specific submission criteria. See Maintainer Entry Pro=
file.
>=20
>     process/maintainer-soc
>     process/maintainer-soc-clean-dts
>     process/maintainer-soc-clean-dts
>     Audit Subsystem
>     process/maintainer-tip
>     process/maintainer-tip
>     mm/damon/maintainer-profile
>     process/maintainer-tip
>     doc-guide/maintainer-profile
>     process/maintainer-tip
>     process/maintainer-tip
>     process/maintainer-soc-clean-dts
>     process/maintainer-tip
>     process/maintainer-tip
>     process/maintainer-tip
>     filesystems/nfs/nfsd-maintainer-entry-profile
>     process/maintainer-kvm-x86
>     nvdimm/maintainer-entry-profile
>     nvdimm/maintainer-entry-profile
>     nvdimm/maintainer-entry-profile
>     process/maintainer-tip
>     driver-api/media/maintainer-entry-profile
>     process/maintainer-netdev
>     process/maintainer-netdev
>     process/maintainer-tip
>     process/maintainer-tip
>     process/maintainer-tip
>     process/maintainer-tip
>     arch/riscv/patch-acceptance
>     Rust
>     Rust [Pin-Init]
>     process/maintainer-tip
>     Security Subsystem
>     Selinux Security Module
>     driver-api/vfio-pci-device-specific-driver-acceptance
>     process/maintainer-tip
>     filesystems/xfs/xfs-maintainer-entry-profile

