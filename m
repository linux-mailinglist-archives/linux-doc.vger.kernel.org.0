Return-Path: <linux-doc+bounces-90466-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJaMHmiTHmqnlAkAu9opvQ
	(envelope-from <linux-doc+bounces-90466-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 10:25:12 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E751062A7DB
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 10:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AFFDE304B094
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 08:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04F83C3BE0;
	Tue,  2 Jun 2026 08:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bpa1KuA5"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7FA3C3C1C;
	Tue,  2 Jun 2026 08:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388023; cv=none; b=evATbd+IvRFN2ROaD6ZCkTRQMGzttMfKjJqogC5l6Yb6F5ijPK+B/92ecAFEEJHRNaJebapke+TZgXu7fQTgyY8HwctM4SlDIj0rFF50fz21tVKPlk4xXM4MMcSoTAHz6CQ+/7gyWtszxmQ0ichFQGC0sk1+UBGxcFZx3IO/6LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388023; c=relaxed/simple;
	bh=ai5RgupvCcS37Dih3Cd0dYsObdLaYroWgKOhVltlr7E=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=W6tEirTUyJgWUpw6VRM0at0O+naZtAD9zj7gfvUi7JRjTlJTU5YBfnX4D5IWV4IYTOEqj4cnOcqlMsLXx6/dShhR+zYfT4C/5w8LtDvlUsA8RdIxxaa9HllZWhZoYgRdMhYB9b1trcO0N1Rw43p9EbpLK8cUSjoxOI488kx1ffI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bpa1KuA5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B3AD1F00893;
	Tue,  2 Jun 2026 08:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780388022;
	bh=dBkjXMTmjLYTnOUwfnks3EFmZB9pPlPFfyMtmk7cI3U=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Bpa1KuA5WsCD66AasZ0sl3TPcc1/4v3KFLp4MBWQ3V/DKp9IxKexcZETomuPehqTH
	 oW7AjhG5pIG0+1zPLNhQr1BDSRpxy0OXJLhEu054Dk67FXWjHvCzfw+yOu7ZSXp9WJ
	 TTMEJZlPB80bvMNID92SiC2lb+b5+MbERApA9AM+sYZsv/xvWNdPNt0RFDlZv4BH8G
	 0lubNHY31s9XSrUDOq0nXy9XEegapfFje+0pK4oRel7PqRqFxQ640yWxWQRe5qEHCX
	 dElzNPk+Fbugx4/pfXDfPeoWC4gg0nTxxb7+/9VvEPJNz0qQnr4IzF0xJ68T7cSaa0
	 DoWuzoVX7NVSw==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 01/13] liveupdate: change file_set->count type to
 u64 for type safety
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
 akpm@linux-foundation.org, linux-mm@kvack.org, skhan@linuxfoundation.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net, 
 dmatlack@google.com, kexec@lists.infradead.org, pratyush@kernel.org, 
 skhawaja@google.com, graf@amazon.com
In-Reply-To: <20260530221938.115978-2-pasha.tatashin@soleen.com>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
 <20260530221938.115978-2-pasha.tatashin@soleen.com>
Date: Tue, 02 Jun 2026 11:13:34 +0300
Message-Id: <178038801483.119771.5551368813719436713.b4-review@b4>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90466-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,soleen.com:email]
X-Rspamd-Queue-Id: E751062A7DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 30 May 2026 22:19:26 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> This improves type safety and aligns the in-memory file_set->count with
> the serialized count type. It avoids potential truncation or sign
> conversion mismatch issues.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.


