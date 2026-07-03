Return-Path: <linux-doc+bounces-94903-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FZJNB5YeSGosmgAAu9opvQ
	(envelope-from <linux-doc+bounces-94903-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 22:41:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5FD705904
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 22:41:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Bsw3jVXJ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94903-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94903-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEAED303CE05
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 20:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC165352C52;
	Fri,  3 Jul 2026 20:37:07 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921DB354AEB;
	Fri,  3 Jul 2026 20:37:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783111027; cv=none; b=fiz4O5XatMhoyE73p4c+HOfaXxoSgK9wsNXsYz7hVOzng6HLNpY1UzLUxLg3pfHUAA21rbL/8uB85kDnPj0SkqazeHgJliCvIuk5T6JaW9sc+0I2FigN1062a0rZg0FBRp/z/ObbedhK20E+pp1+ZP6rrRgvJDXhpKPrfkM5c/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783111027; c=relaxed/simple;
	bh=nARVJzCvlJdWen6tHgih65heizn73fKc3cYJ+Slhnsk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=YMs5ki45conDMEK9+BS5KrHbAvY0kK3cbKQRADFdCj4O7qXFBJEE+2BErgh9bILc2LwB8IYFILc25MVG3S3rZMGXRJ5g2KgwjUrBiMKdZDtlvlOHXTS8jaVmZrzgTghZKh4x4kqnJL/d1Buxg7Qyd1sD2vekuxyMJdMrau2gmdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bsw3jVXJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC3E1F000E9;
	Fri,  3 Jul 2026 20:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783111026;
	bh=RMsPOOLbKOlYGKOrwP/9gZ2iVrIMCs5Jo2s/YiBxGf4=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=Bsw3jVXJnd6loZHoLe5wprSttkLm9u4zktWE8P32p/l8tO8YpPdJ9GasY4TcMytLP
	 Ok8rxJ5MjZ4t9rzd23ZH/LNShuFx/6d1i74a9uzI7ShaF5aegdXP+j/Tk9diSnOZU6
	 qpXM+fJAsbHLRtddJrCnfCCt0hhk295riuSWZMvbcHYRoEX/FNbx3X1UNlqOw3xLgx
	 orCm1WdKJ/9seEKrX1P/NujoCrVqeFe31LlKR2RN24v4evCzBGKXq20TUcPzQGINzE
	 sVIJ4DgjIDNhs/sp0JrGCHPz5In8sMkIMudvq3g7HQgKDkuzWTq4ijD9G6K8GSiIzP
	 qW2TNFVeRik6A==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 22:37:03 +0200
Message-Id: <DJP83RJ4N7HN.2ZT3XI74J62GN@kernel.org>
To: "Rafael J.  Wysocki" <rafael@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v1 1/2] 1/2] ACPI: bus: Eliminate struct acpi_driver
Cc: "Linux ACPI" <linux-acpi@vger.kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Hans de Goede" <hansg@kernel.org>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "LKML"
 <linux-kernel@vger.kernel.org>, "Linux Documentation"
 <linux-doc@vger.kernel.org>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, <driver-core@lists.linux.dev>
References: <6027395.DvuYhMxLoT@rafael.j.wysocki>
 <5132944.31r3eYUQgx@rafael.j.wysocki>
In-Reply-To: <5132944.31r3eYUQgx@rafael.j.wysocki>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94903-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:linux-acpi@vger.kernel.org,m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:andriy.shevchenko@linux.intel.com,m:driver-core@lists.linux.dev,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dakr@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A5FD705904

On Wed Jul 1, 2026 at 9:16 PM CEST, Rafael J.  Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>
> Now that struct acpi_driver has no more users, eliminate it along with
> all of the code related to it.
>
> Also remove the file added by commit b8c8a8ea18ad ("ACPI: Documentation:
> driver-api: Disapprove of using ACPI drivers") because it will not be
> necessary any more after eliminating struct acpi_driver from the code.
>
> No intentional functional impact.
>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

