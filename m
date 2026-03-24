Return-Path: <linux-doc+bounces-81100-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBC2D8H2wmkEngQAu9opvQ
	(envelope-from <linux-doc+bounces-81100-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 21:40:33 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F095131C6C2
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 21:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 102F930D3A41
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2026 20:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8292D3537F7;
	Tue, 24 Mar 2026 20:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJF6J1u1"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4A735295C;
	Tue, 24 Mar 2026 20:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774384636; cv=none; b=jOIXGHxHQMFhC4wXsFHibliVZC6AFNNEz7ysxCN0Jn83UwwK89pL1mZkyQ8zlqOI9dN/yyWO0+n1UTzdAN1xD+oAgizeDbXdHSFc/0U3lR2zHmOuNbTtFF84Q1yEGgSfI+4I+sCrtTw/wZmURnIwShuRX5mHuJ4LdGf2iMeGE+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774384636; c=relaxed/simple;
	bh=/6Uj9XwUoAPU0BcQZVOTdOUSFBimlsKmIkp3D+XTOGA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=s5+HZypA634wH48DgLg+/yaKGLg/brqyUwVRA3FnzTPdwkrkxxBo2AuzqFEpA2Jg6VT187TSx7oAghgctabXj5MxG55M1V7vDKnw8KywlR8AyVA7IdX4F3Al9vhm1Kqv2tOy011sB3/RkFqirAFAIYY9qZ1xAuJsx4OFHiBPUfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJF6J1u1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD82C19424;
	Tue, 24 Mar 2026 20:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774384635;
	bh=/6Uj9XwUoAPU0BcQZVOTdOUSFBimlsKmIkp3D+XTOGA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AJF6J1u1aBc8bJ41M/rs6gPK1I0vsIsmTHBnAC2WdImh8tEMZVxGvXMrUMbE6srqF
	 giKj7K490hqaPntvL0NLwJvs10+k9UUPelayodLBorc9Ypb2GcUJWADBWG2zaqpGQ4
	 3QmKzq4hLM6q3CwYRRqPWpKjvA8yXCaveQ9r9kUoMQn5Fo8vt7sFw1t56sGRVJM3WN
	 Rm0PDgnDh7U3VzJ4fE/we49SCd+BSoAXg1l5TLtRu+gXrXi+qOA5ZpVyaw3NcjfCbL
	 4mFWwoqJON9+mOd72ekaTbcxvZ4HrMvtQMLhr8+WHgQW7w2+1z56FneAU4hTvtVZ9b
	 VNmZoY41olotA==
Date: Tue, 24 Mar 2026 10:37:14 -1000
Message-ID: <af7ad66fe192eb600220c3eaf554e246@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: zhidao su <soolaugust@gmail.com>,
 linux-doc@vger.kernel.org
Cc: corbet@lwn.net,
 sched-ext@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: Raise minimum pahole version to 1.26 for
 KF_IMPLICIT_ARGS kfuncs
In-Reply-To: <20260324184718.3747428-1-suzhidao@xiaomi.com>
References: <20260324184718.3747428-1-suzhidao@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81100-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SINGLE_SHORT_PART(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F095131C6C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Applied to sched_ext/for-7.1.

Thanks.

-- 
tejun

