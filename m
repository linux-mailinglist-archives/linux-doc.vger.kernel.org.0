Return-Path: <linux-doc+bounces-88030-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJUyF+H7CWpPvwQAu9opvQ
	(envelope-from <linux-doc+bounces-88030-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 19:33:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A78BA56297A
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 19:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27A5F3002286
	for <lists+linux-doc@lfdr.de>; Sun, 17 May 2026 17:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D37E83BB680;
	Sun, 17 May 2026 17:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ATudrdgA"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773AE3C6A27;
	Sun, 17 May 2026 17:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779039078; cv=none; b=qIfhSNjj4yoJIA5EcpPzFPU+s7L2eDrZsm5tquWPIDCgax46Q4pXqGbj4nYolmSExrIe5aupwYDyKEDp0HU5GZEHhu6j2vciQL5+NLK+tsizpCi9nNf9cZul6iNjGQeffe8SrmxtPw52J90qmN+bWNETv6oTRwQ8DAjWAeIyGSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779039078; c=relaxed/simple;
	bh=+aUjJ1d0JLkcLl5wfHdzIg1GFF63EALYJshPzkwzzWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PphSwXZss/Bv98GVC4TLoVSkOwFdOefKZp99afrUc0l7/7jIRRQeNddm+1xrlRfRzNVuA2R3ZkbizXTFxcDJjYEY7sQlhme0POPo0ZhCmVUvvqYt9g5eeJ+WbTrFF3r+6oIxWQVw1nqLbufm/kevosb+suY4opV2KtWjZWUk80Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ATudrdgA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918B0C2BCB0;
	Sun, 17 May 2026 17:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779039078;
	bh=+aUjJ1d0JLkcLl5wfHdzIg1GFF63EALYJshPzkwzzWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ATudrdgAiAFP4FEfv8ThrK2psXtOQgx8sXHFshWDMMTTuGVH4CMNWy9K9lhSWo9Mf
	 5DupSbZ6y5SI6XPloBrlt3dCIIznNJP5tSCT1346pT17DNoLyE3dqQUUlMB/4TePD2
	 e9Mxeg6wnZm6SQ1vCGuvVSXXYbh+pvblsFS6QS2FCZi0DOdlL4Xd8V4qDG5h9L2Nge
	 jNFBff+2mssd62VCHPlFXyW0/c2eRPnTFjTnOYphBteuCELIYPmLh0KmQMdwSu+DNl
	 B3GTtS9UqqUjGy2KBciMoaQqQcVlWBJbJ4Gq8HUayIbjktidN91bW44PVTrzbhnofm
	 d8+0D1W3PgWkw==
Date: Sun, 17 May 2026 20:31:10 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net, dmatlack@google.com,
	kexec@lists.infradead.org, pratyush@kernel.org, skhawaja@google.com,
	graf@amazon.com
Subject: Re: [PATCH v2 05/10] liveupdate: defer session block allocation and
 PA setting
Message-ID: <agn7XnuO7VU4eK52@kernel.org>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
 <20260514222628.931312-6-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514222628.931312-6-pasha.tatashin@soleen.com>
X-Rspamd-Queue-Id: A78BA56297A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-88030-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[soleen.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 10:26:23PM +0000, Pasha Tatashin wrote:
> Currently, luo_session_setup_outgoing() allocates the session block and
> sets its physical address in the header immediately. With upcoming
> dynamic block-based session management, this makes the first block
> different from the rest. Move the allocation to where it is first needed.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
> @@ -77,15 +77,16 @@
>  
>  /**
>   * struct luo_session_header - Header struct for managing LUO sessions.
> - * @count:      The number of sessions currently tracked in the @list.
> - * @list:       The head of the linked list of `struct luo_session` instances.
> - * @rwsem:      A read-write semaphore providing synchronized access to the
> - *              session list and other fields in this structure.
> - * @header_ser: The header data of serialization array.
> - * @ser:        The serialized session data (an array of
> - *              `struct luo_session_ser`).
> - * @active:     Set to true when first initialized. If previous kernel did not
> - *              send session data, active stays false for incoming.
> + * @count:       The number of sessions currently tracked in the @list.
> + * @list:        The head of the linked list of `struct luo_session` instances.
> + * @rwsem:       A read-write semaphore providing synchronized access to the
> + *               session list and other fields in this structure.
> + * @header_ser:  The header data of serialization array.
> + * @ser:         The serialized session data (an array of
> + *               `struct luo_session_ser`).
> + * @sessions_pa: Points to the location of sessions_pa within struct luo_ser.
> + * @active:      Set to true when first initialized. If previous kernel did not
> + *               send session data, active stays false for incoming.

Hmm, why addition of a single field changed the entire block? :/

>   */
>  struct luo_session_header {
>  	long count;

-- 
Sincerely yours,
Mike.

