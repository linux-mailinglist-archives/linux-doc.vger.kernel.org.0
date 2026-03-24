Return-Path: <linux-doc+bounces-81055-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIJ8NPrJwmmIlgQAu9opvQ
	(envelope-from <linux-doc+bounces-81055-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 18:29:30 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CA931A053
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 18:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAC90300B560
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 17:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DEA402453;
	Tue, 24 Mar 2026 17:29:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CEF37F74A;
	Tue, 24 Mar 2026 17:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774373344; cv=none; b=mDlHJ+E/rXqSv+FPtefK/oaOvp0IB6VQyYWV0JC0ckywVVfOQL2Zn1RW2WCwjd9sv2pdNPnitA3LiDnx6yosxYMcLJDj9LXliAF8KjmyUolwbhYmUX1VzO/DGMBEKAVrQYqbC5gm15gQMKSREYcUF3YPYZBImsj9d2yGyTWg5dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774373344; c=relaxed/simple;
	bh=FzVoLizmej6y/KwQewc+Wa1rPlSnqqxkGLzFV3Tq1GE=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NEQEB13JIg8gwjDHaVikGW0rd9oTe4wv/Gop7cJWrA4QJlwOPG9Jsh/HEvinJEVW5jpNkI9ucGamvnuXds3z6PqRDm0fMnqKLdgCtXqsj5VCLNIyJgzTYykKho1EuSSAqVOUxGsE4KU63/vLqECZsFidI7EvMMyVPL1hZtTd6To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fgH7X02xyzHnH5b;
	Wed, 25 Mar 2026 01:28:24 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id BC76F40587;
	Wed, 25 Mar 2026 01:28:57 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Mar
 2026 17:28:56 +0000
Date: Tue, 24 Mar 2026 17:28:55 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ahmed Tiba <ahmed.tiba@arm.com>
CC: <linux-acpi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-cxl@vger.kernel.org>, <Michael.Zhao2@arm.com>, <robh@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <Dmitry.Lamerov@arm.com>,
	<rafael@kernel.org>, <conor@kernel.org>, <will@kernel.org>, <bp@alien8.de>,
	<catalin.marinas@arm.com>, <krzk+dt@kernel.org>, <linux-doc@vger.kernel.org>,
	<mchehab+huawei@kernel.org>, <tony.luck@intel.com>
Subject: Re: [PATCH v3 01/10] ACPI: APEI: GHES: share macros via a private
 header
Message-ID: <20260324172855.000032fb@huawei.com>
In-Reply-To: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-1-48e6a1c249ef@arm.com>
References: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-0-48e6a1c249ef@arm.com>
	<20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-1-48e6a1c249ef@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[huawei.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-81055-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathan.cameron@huawei.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 54CA931A053
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 18 Mar 2026 20:47:58 +0000
Ahmed Tiba <ahmed.tiba@arm.com> wrote:

> Carve the CPER helper macros out of ghes.c and place them in a private
> header so they can be shared with upcoming helper files. This is a
> mechanical include change with no functional differences.
> 
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>

> diff --git a/include/acpi/ghes_cper.h b/include/acpi/ghes_cper.h
> new file mode 100644
> index 000000000000..a38e3440b927
> --- /dev/null
> +++ b/include/acpi/ghes_cper.h
> @@ -0,0 +1,103 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Shared GHES declarations for firmware-first CPER error handling.
> + *
> + * This header groups the GHES declarations that are needed by the shared
> + * CPER handling path.
shared CPER is unclear.  Start with something broad like:

GHES declarations are used both for ACPI APEI handling and xyz.

I'm not sure I'd put any additional justification here beyond such a
simple sentence.

> + *
> + * The split lets GHES and other firmware-first error sources use the same

I would consider rewriting this.  What split?  Not obvious from what you have
in this header.

> + * code for reading status blocks, caching records, handling vendor data,
> + * and reporting errors, so the non-ACPI path follows the same behavior as
> + * GHES instead of carrying a separate copy.
> + *
> + * Derived from the ACPI APEI GHES driver.
> + *
> + * Copyright 2010,2011 Intel Corp.
> + *   Author: Huang Ying <ying.huang@intel.com>
> + */
> +



