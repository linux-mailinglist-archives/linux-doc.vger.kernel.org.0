Return-Path: <linux-doc+bounces-88034-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wK1EKqH9CWqqvwQAu9opvQ
	(envelope-from <linux-doc+bounces-88034-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 19:40:49 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 589B9562ACE
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 19:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA70A3007CA8
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 17:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE9F34F49F;
	Sun, 17 May 2026 17:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4Z0tbN2"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1925423E358;
	Sun, 17 May 2026 17:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779039440; cv=none; b=NwExni2lZKYxB4LH9A+6s4EXjdVajgDU05/ZR6sWoDVGRqONE3RraaQ/COiouSHTdl8DnRDXE51YwlgpFGXgHOdW7EAznAbLALMOpM8Qjm0c+64IaVBmQi+G2U0oLkv2oSGJnDGVHYH9LMAHxWjZIrYwq+ffJphLguEYKbBI2zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779039440; c=relaxed/simple;
	bh=heISmBIXKjYA/PcXWrm1JL8+liejO4P4u/DbNOAbEhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odnW2o7cWUo73FQfPlcH8SO3M8A214zmj5VEFUfrLPwR+hmASNYjl3oc8UnVPDfqdw37AxTYTeF+SdqnJp++oakDglHsE37CDaH0LzRzywwZjzrycbeS1dyRYC+iisUJuOestQ+ZqBBxdkNuMI6UdRykzNOYX6mSo2eCWgOUPsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4Z0tbN2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BCC7C2BCB0;
	Sun, 17 May 2026 17:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779039439;
	bh=heISmBIXKjYA/PcXWrm1JL8+liejO4P4u/DbNOAbEhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B4Z0tbN2A1OK22DR42hgCLTmeRx4VTbKz4jGtH+Duv3y3zMD8eOlMeywPQbDJigkk
	 44MEeSgbeqd2X9dYLqF0yonVJwYbAwZf/sUhwwJCar3JMyRiy9c8/fvAG19SCVNwrd
	 +tNl+6zcVvLhE4XlYh2Aj7AK9pOCAVHW9CO/nBPNUjIZdwjljqlVr4Q6E2EVUCHaFP
	 6H0Tl7m0pZjaz99wHUTGiWRdcsk01uHOSqHLpiNN342xAYkpxCu3O47oti0ct4ojJz
	 0Sb6x6hX07KDWMSRHD7w+1tkaloJgZQq9UHL4Zb6fWrJz0pepF+M/cgRzx9q4Av3m8
	 H8c0BE05EHC/Q==
Date: Sun, 17 May 2026 20:37:12 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net, dmatlack@google.com,
	kexec@lists.infradead.org, pratyush@kernel.org, skhawaja@google.com,
	graf@amazon.com
Subject: Re: [PATCH v2 09/10] selftests/liveupdate: Add stress-sessions kexec
 test
Message-ID: <agn8yJVcdvPw8ZCQ@kernel.org>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
 <20260514222628.931312-10-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514222628.931312-10-pasha.tatashin@soleen.com>
X-Rspamd-Queue-Id: 589B9562ACE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-88034-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,soleen.com:email]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 10:26:27PM +0000, Pasha Tatashin wrote:
> Add a new test that creates 2000 LUO sessions before a kexec
> reboot and verifies their presence after the reboot. This ensures
> that the linked-block serialization mechanism works correctly for
> a large number of sessions.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  tools/testing/selftests/liveupdate/Makefile   |   1 +
>  .../liveupdate/luo_stress_sessions.c          | 102 ++++++++++++++++++
>  2 files changed, 103 insertions(+)
>  create mode 100644 tools/testing/selftests/liveupdate/luo_stress_sessions.c

-- 
Sincerely yours,
Mike.

