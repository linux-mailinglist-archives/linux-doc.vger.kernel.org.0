Return-Path: <linux-doc+bounces-90664-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z3i4JSPPH2qtqAAAu9opvQ
	(envelope-from <linux-doc+bounces-90664-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 08:52:19 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 272F8634D6C
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 08:52:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=J5OZ0l4i;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90664-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-90664-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8CFF0300BB97
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 06:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56FD239478B;
	Wed,  3 Jun 2026 06:52:10 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BD52652AF;
	Wed,  3 Jun 2026 06:52:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469530; cv=none; b=BHUtbl0FBwy3QqJOubEzs19/PL0sEq2Hn3+7uWPPGAZn2B/et+ZqaXB26cAuOOeRcNVyTHMNVMlnts2urH/QoZ4oI5ZsvAaEpgoEft6Iuny68bSZTA/cOzfp65UkOjuTXOY6bI03nUOxXDu/9LiP04q/eMV5z4ekRSlQwS5hUC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469530; c=relaxed/simple;
	bh=tGGYAS/IexlJYpq2Sqxx65gZbCGurBzM7D2SxQTTdA0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=sxQHUmEv6SX3dhBO6FxRVI9hnMe6PVfYTl3n49czVw4uG3WuZfglMrSTI0gCPLkoW4VHtgomdqG49GYi7jf/IjpQvofIamoUnarVGnPxsZ3V3JU+qxeEw7xnzPwLyXs53tUMQHfNsPOVshYLFdw09aMcCwt5F8lMmfMcOSjLWfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5OZ0l4i; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F3C1F00893;
	Wed,  3 Jun 2026 06:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780469529;
	bh=Xz6Wac4dFBhlZu9nlXxNnHAnl4msktquKY/eR4n6NfM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=J5OZ0l4ipDVsuhKD3zeAA3+kRDn3mJrhMzJ8bMuR/1HJU7Wvw8qy+Hr1TgSzT63Pj
	 hjdKNCqH1cgOXPvOiyWxQ+I33Z3qdEJiLFBnKvC48d6K2k083loJKmGhvgPX01XQpw
	 ECyf0L1tqscWRK3PfRZEYJqnebKN6cTT9P+YjaIbLGYZt6qp6hC2MFdh+VT7A396A8
	 +4kWhrv9hBq8Y6BZI3xYqit9B+uclK6AyOe1YMJpbRooF71wSo1ASk84/keYiTVPvx
	 DEqrX4IWvBMcZB+79jPqrAci9MAdQWc6r9/xoMtqFzoGNtPCZ9SjU4hIK9PrI9G9X9
	 Rh+uAzD4eHEMQ==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 02/13] liveupdate: avoid mixing cleanup guards with
 goto in luo_session_retrieve_fd
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
 akpm@linux-foundation.org, linux-mm@kvack.org, skhan@linuxfoundation.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net, 
 dmatlack@google.com, kexec@lists.infradead.org, pratyush@kernel.org, 
 skhawaja@google.com, graf@amazon.com
In-Reply-To: <20260603032905.344462-3-pasha.tatashin@soleen.com>
References: <20260603032905.344462-1-pasha.tatashin@soleen.com>
 <20260603032905.344462-3-pasha.tatashin@soleen.com>
Date: Wed, 03 Jun 2026 09:52:02 +0300
Message-Id: <178046952227.468621.16091000479096712016.b4-review@b4>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:pasha.tatashin@soleen.com,m:linux-kselftest@vger.kernel.org,m:rppt@kernel.org,m:shuah@kernel.org,m:akpm@linux-foundation.org,m:linux-mm@kvack.org,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:corbet@lwn.net,m:dmatlack@google.com,m:kexec@lists.infradead.org,m:pratyush@kernel.org,m:skhawaja@google.com,m:graf@amazon.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-90664-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,soleen.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 272F8634D6C

On Wed, 03 Jun 2026 03:28:53 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> Refactoring luo_session_retrieve_fd() to avoid mixing automated
> cleanup-style guards with goto-based resource release, which is not
> recommended under the Linux kernel coding style.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.


