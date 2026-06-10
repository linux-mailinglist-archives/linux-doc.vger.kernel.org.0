Return-Path: <linux-doc+bounces-91840-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4rDVHmVNKWqUUQMAu9opvQ
	(envelope-from <linux-doc+bounces-91840-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 13:41:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7636C668E23
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 13:41:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=VXTfeNQq;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91840-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-91840-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 494143004CA3
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 11:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922153E450A;
	Wed, 10 Jun 2026 11:38:32 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAB23A782B;
	Wed, 10 Jun 2026 11:38:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091512; cv=none; b=QiHFcxXzJzt1pjZtm9oq/+Az2ejVUQl6HQD0rGBYtQNsMPWVvO36lwYUvzKRKQr1mM1IKytgSyOSmQhKt0wSS+Ulu+SewkFs5JmD4dM17Mq6zTP/p885gBXicDrum5OSTe/xBNMzBTwCqmx4iy398ZnnnIDCTJzZ/akW8RYbBbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091512; c=relaxed/simple;
	bh=IX6LtUMmsf2vlnGeHD/63983rh0Y9HBJ2QJ31uk5kmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eu61PtznKTrS1Xz0D6I4J10R2KQaXKoK9okHT1puRZ9Ij5TuhMYPDZEy7txz7tdOwpWxT8FrL53MfxG8R1nBcSuxcOnnXG6Rvk/pWp4C4HdrM1KeQzi97l9KWOJKal2/ZJyk6Vjxz0RgJ9pVvQFjpIXdy9AHjcwUHXBJAJDnFus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VXTfeNQq; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7480125E3;
	Wed, 10 Jun 2026 04:38:25 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F0923FD88;
	Wed, 10 Jun 2026 04:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781091510; bh=IX6LtUMmsf2vlnGeHD/63983rh0Y9HBJ2QJ31uk5kmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VXTfeNQqSRNFjUTSHZpgYIIQlFGsLLyXII67TjUaJHzh4VW0XA+pPOcbymtdDCuac
	 1emh1qFB4U3M7OLirkhEwwYRU44hhKygV7pU4bGjbJ741RO//JZBdAV7ktUlxQU8rL
	 4jjw9yOmmm9i/AHV5QjmSCCz8pUbsZJIN28z2B/M=
Date: Wed, 10 Jun 2026 12:38:20 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: will@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	punit.agrawal@oss.qualcomm.com, mrigendra.chaubey@gmail.com,
	suzuki.poulose@arm.com, chenl311@chinatelecom.cn,
	fengchengwen@huawei.com, maz@kernel.org, timothy.hayes@arm.com,
	lpieralisi@kernel.org, arnd@arndb.de, gshan@redhat.com,
	jic23@kernel.org, dietmar.eggemann@arm.com, sudeep.holla@kernel.org,
	pierre.gondois@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] arm64: smp: Fix hot-unplug tearing by forcing
 unregistration
Message-ID: <ailMrGQv1LQ0xmXe@arm.com>
References: <20260610075202.3597031-1-ruanjinjie@huawei.com>
 <20260610075202.3597031-2-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610075202.3597031-2-ruanjinjie@huawei.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,oss.qualcomm.com,gmail.com,arm.com,chinatelecom.cn,huawei.com,arndb.de,redhat.com,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-91840-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:will@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:punit.agrawal@oss.qualcomm.com,m:mrigendra.chaubey@gmail.com,m:suzuki.poulose@arm.com,m:chenl311@chinatelecom.cn,m:fengchengwen@huawei.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:arnd@arndb.de,m:gshan@redhat.com,m:jic23@kernel.org,m:dietmar.eggemann@arm.com,m:sudeep.holla@kernel.org,m:pierre.gondois@arm.com,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[arm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,arm.com:mid,arm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,sashiko.dev:url,vger.kernel.org:from_smtp,huawei.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7636C668E23

On Wed, Jun 10, 2026 at 03:52:01PM +0800, Jinjie Ruan wrote:
> Sashiko review pointed out the following issue[1].
> 
> Commit eba4675008a6 ("arm64: arch_register_cpu() variant to check if
> an ACPI handle is now available.") introduced architectural safety
> blocks inside arch_unregister_cpu(). If a hot-unplug operation is
> determined to be a physical hardware removal (where _STA evaluates to
> !ACPI_STA_DEVICE_PRESENT), or if firmware evaluation fails, it aborts
> the unregistration transaction early to protect unreadied arm64
> infrastructure.
> 
> However, returning early from arch_unregister_cpu() causes a catastrophic
> state tearing because the generic ACPI layer (acpi_processor_post_eject())
> unconditionally continues its cleanup flow. This leaves the stale sysfs
> device leaked in the memory, deadlocking any subsequent hot-add attempts
> on the same CPU.
> 
> Fix it by simplifying arch_unregister_cpu() to always proceed with
> the unregistration, as a pr_err_once() warning is sufficient to make
> it more visible for currently not supported physical CPU removal.
> Also remove the redundant NULL check on acpi_handle as it cannot be
> NULL when calling arch_unregister_cpu().
> 
> [1]: https://sashiko.dev/#/patchset/20260520022023.126670-1-ruanjinjie@huawei.com
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: James Morse <james.morse@arm.com>
> Cc: stable@vger.kernel.org
> Fixes: eba4675008a6e ("arm64: arch_register_cpu() variant to check if an ACPI handle is now available.")
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

