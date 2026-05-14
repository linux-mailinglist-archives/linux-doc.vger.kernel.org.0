Return-Path: <linux-doc+bounces-87455-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCvrJUVNBWoIUgIAu9opvQ
	(envelope-from <linux-doc+bounces-87455-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2026 06:19:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF0453D9FA
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2026 06:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93EDA304D25E
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2026 04:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB8B293C42;
	Thu, 14 May 2026 04:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5VZAaFl"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB4623EA9B;
	Thu, 14 May 2026 04:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778732215; cv=none; b=CbfDo5FEHFW2Q9TKfOVl34qrm8KmRg4uxPv01NerU+PXC4SOP351v2elKuJNUD6B7LHQ1v2XHf06GW7P7Cx7nCRHVP1l795jhPRD4XzAqk6vKcpjfKrVoOxpsz7g4+KvKzANI0B4IppRB6vvHFr38R4an1aPcNcbYOkUrPCFXuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778732215; c=relaxed/simple;
	bh=BQSZ9ee/VgHstNC8tJm0ej+5RQbrx3NRClPwFKpSEWQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fJfHlvmVUeJDR9UOvpTQAywnuEWCWCco9WHYA5I8YvKY4iZsgSxnOkGFCu7bMQzYryDYzbwxL1CCoVJ1mUd9oTmy44bojr8gL7TmYyX2NTlOepbg8Oa5J21zq9XVvsWJ3mzPkVOd/942bj4/ewbMUKZyaKVH84qbUovzzFVBwzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5VZAaFl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21CCC2BCB7;
	Thu, 14 May 2026 04:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778732214;
	bh=BQSZ9ee/VgHstNC8tJm0ej+5RQbrx3NRClPwFKpSEWQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Q5VZAaFlwLXXpqqzimWpLMDbbAvVO0PBwYRla5alMQ8B7Qh1yJRvBb0GT4wPTj1wI
	 hbJfDhqfp+7ggqH5AFoaq60IrqhqsbekJyEAaWMpJogGcpfMtUcKbqspJwn/QCfcxS
	 0197NRkY5U8Z3F/L3zFaTAHwDzFyOW9+nt8eKptTNhouAzLijKyVduk0YptUWzD6hk
	 5P1PD224YEuruHYIvIk42jfNx6FifBvwr+ZGkj+x9Nxpgt8V9/fV7aCVQyaeiMG3pA
	 AP/9nJVx4SgjAjQE2Re88frycf8nsHkQasSWqdpk+Jy8v5iNqIr2RAXEFsZRCMfmb2
	 o79myiZ8PutSw==
Date: Wed, 13 May 2026 22:16:49 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
cc: linux-kernel@vger.kernel.org, Deepak Gupta <debug@rivosinc.com>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, 
    Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] riscv: Docs: fix unmatched quote warning
In-Reply-To: <4827939a-2e8e-4ac7-981c-deb3b7296a66@infradead.org>
Message-ID: <590cf7aa-1e0c-6cc2-ab69-53d2680f9d36@kernel.org>
References: <20260406232304.1892528-1-rdunlap@infradead.org> <4914fc7a-607f-41bb-891e-89df83a0b292@infradead.org> <4827939a-2e8e-4ac7-981c-deb3b7296a66@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 2DF0453D9FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-87455-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pjw@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Randy,

On Wed, 13 May 2026, Randy Dunlap wrote:

> This docs build warning is now in mainline.
> Should I ask Jon to merge the patch, given no activity on it?

Sorry about the delay; I'll pick it up as a fix.


thanks,

- Paul

