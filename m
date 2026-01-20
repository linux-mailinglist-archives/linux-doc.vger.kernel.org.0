Return-Path: <linux-doc+bounces-73298-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIprITPOb2mgMQAAu9opvQ
	(envelope-from <linux-doc+bounces-73298-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 19:49:23 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E79B449C7B
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 19:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1038B94C7D2
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 16:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A1830FC01;
	Tue, 20 Jan 2026 16:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M15qmp5z"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C38130F813;
	Tue, 20 Jan 2026 16:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768926756; cv=none; b=l8scWvHO1NiaAe52bZpT/AQKXf63tZk/67S39lZMSROrnUTVDXWI+HePywd29vxcK7ghPC7wC2RH2MvOyfjYcAGCWVLGrCRhZM5tE4sxEueNER1O6V/GdEhNOSNCzLtDmrNwGrZuVpNAmxZbMlTKC7D/OZDMF7143zKS3rFkkJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768926756; c=relaxed/simple;
	bh=BkuoYdiOjEdaSxlt18GMMC+iBXjttPiaqaXPWhOTAOg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tMEJqTNyoDnYSd0wkG4bNCPLggz2cYaYvkUPIJm3kPVRv+eGVRWOiWb06YN2OtQtYZSHJObdhbX1aWBYDx+e5qWha7QsfDDwdV0MINvndELeA7DxPMw1991igpoEK0kTQ8B2U5yv0xfR86qmnY99ZVFH1c0DqNJGUsmhBvtfZ0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M15qmp5z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF72C16AAE;
	Tue, 20 Jan 2026 16:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768926756;
	bh=BkuoYdiOjEdaSxlt18GMMC+iBXjttPiaqaXPWhOTAOg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=M15qmp5zcgPGZax3J+ZpO3YDXmk7U0i6dtAhX2uoznBFQL6z5+MRRhW9PsqcRm1qP
	 oL33nkA/ilfO744wGvuCqNvPRWbuskm3T9vocCqHZoMXP3wuH19kiHhQJ7AX9YYL5g
	 ANehmWMB5hXgbPWRvRn3jXjgOHfvCWhlFiHmRerz+D52DzvXq6rgdViR5uplteyW3z
	 Q1Nm/DQLL/ois8KKJ2sqoNfliwN0DFQMdwRV0+29Ok0CNq6xiSr73DLWWTl3wvxeku
	 KrBOWFA4RZ3lBbyc2JG+BJ1aF2eB57Uyw2VkRpycAgiOSy2yDKJwTbW0bQFVriPBdu
	 pvNuc20XRJrHQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,  Alexander Graf
 <graf@amazon.com>,  Jason Miu <jasonmiu@google.com>,  Jonathan Corbet
 <corbet@lwn.net>,  Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush
 Yadav <pratyush@kernel.org>,  kexec@lists.infradead.org,
  linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH 0/6] kho: ABI headers and Documentation updates
In-Reply-To: <20260105165839.285270-1-rppt@kernel.org> (Mike Rapoport's
	message of "Mon, 5 Jan 2026 18:58:33 +0200")
References: <20260105165839.285270-1-rppt@kernel.org>
Date: Tue, 20 Jan 2026 16:32:32 +0000
Message-ID: <2vxzms28ckin.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-73298-lists,linux-doc=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[pratyush@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: E79B449C7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 05 2026, Mike Rapoport wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Hi,
>
> LUO started adding KHO ABI headers to include/linux/kho/abi, but the
> core parts of KHO and memblock are still using the old way for
> descriptions on their ABIs.
>
> Let's consolidate all things KHO in include/linux/kho/abi.
>
> And while on that, make some documentation updates to have more coherent
> KHO docs.

Thanks for working on this! It is nice to have the ABI consolidated and
cleaned.

[...]

-- 
Regards,
Pratyush Yadav

