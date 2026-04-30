Return-Path: <linux-doc+bounces-85240-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGLJCtmo8mmgtQEAu9opvQ
	(envelope-from <linux-doc+bounces-85240-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 02:56:57 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9749249BDCF
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 02:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10A623014645
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2026 00:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C181A6828;
	Thu, 30 Apr 2026 00:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5O0uOFk"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645FB5474F;
	Thu, 30 Apr 2026 00:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777510614; cv=none; b=Ie1aPiYtf02iXB/yXtITmYBjeEWEY5jLBPIV9p2Ggw0t0cya2rYjGv0CCBnQ3082ERogL5hdieHr0f1p6+fhXhTISnjiumi9e70EwKr65pHlUtRDIP7xdVPInroLC7yi06UeDEZ3xc348eh+GiEjk20et67eV2SnjVSYcynaT/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777510614; c=relaxed/simple;
	bh=iKtlWudWf4yk0Lw+o/8AER/401ttw3Z21zzRCj0TtyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=selw3r+Oqx4I1ovnTtaZ0gVV0M4D3Vz78bawv0+MqhRsRsGVR4tukbYYz/23DNNfZVOAAnDG4YlcweFFaNJZ33C3ko4tVbV8V3woeeEb5vUeJi78dU7zSoL9Qijo1suXRRPi0Pke2OHv0R27LKZNHuht38LXGHM6WBudlfGVRRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5O0uOFk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A82FC19425;
	Thu, 30 Apr 2026 00:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777510613;
	bh=iKtlWudWf4yk0Lw+o/8AER/401ttw3Z21zzRCj0TtyA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T5O0uOFkB400nD6lpKCMSJhkVo3JAz+oQGI4I1AYyFmKnID7GhY3MajEdF+gonuiy
	 kPw3kFuwGCWFPghkeNq74M1zRcFk70/Wo4/o9hspxulsq2lf7V/eTaRMy614D2ciUT
	 IAteBdqdhamoTivv77BZCpUNVGVefsA3TcbX1UWAub8ExTz1cVkRlHIOyF3JyCtffL
	 ZZKWYQGCVQcMiekKxKI6t7btxPXWVTxNPREnHs9RlP9iEvuvw4ro4J5bLri11gswva
	 KopiZLOt598FQCTMPWZoYxukgy/SOJSb0nBoyZxHrk5qFfqRHf3Ihbah1Po8vp5z7O
	 vxnlv/dNKN6Cg==
From: SeongJae Park <sj@kernel.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: SeongJae Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	linux-mm@kvack.org,
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v4 2/3] Documentation: RCU: adopt new coding style of type-aware kmalloc-family
Date: Wed, 29 Apr 2026 17:56:45 -0700
Message-ID: <20260430005645.113819-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260429072320.310817-2-manuelebner@mailbox.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9749249BDCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85240-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email]

On Wed, 29 Apr 2026 09:23:21 +0200 Manuel Ebner <manuelebner@mailbox.org> wrote:

> Update Documentation/RCU/* to reflect new type-aware kmalloc-family
> as suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj()
> and family")
> 
> ptr = kmalloc(sizeof(*ptr), gfp);
>  -> ptr = kmalloc_obj(*ptr);

Shouldn't 'gfp' parameter be kept?

> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> Acked-by: Paul E. McKenney <paulmck@kernel.org>

Other than the above,

Acked-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]

