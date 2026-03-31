Return-Path: <linux-doc+bounces-81834-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLuSH86zy2kpKAYAu9opvQ
	(envelope-from <linux-doc+bounces-81834-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 13:45:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCDB36902D
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 13:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 33EF9302879F
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 11:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95683C5555;
	Tue, 31 Mar 2026 11:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="slwpgFU+"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909453D9027
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 11:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774957399; cv=none; b=MuDQtRCVIwcFjG8C/wsTle/hq9EKN4NvvVCskYdooYF1dY1k5ilYHpY3ruAbmOuij0zK7KSpuydS/d0nfDn5g5TTn98Pcrx9Sa4PR3NQ6bAde2mveVTI6kDveyU3LL1RQEpprPa1cvNMW+IKunPeklXnMEwHRdTkx9IioSX0fyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774957399; c=relaxed/simple;
	bh=m0oflwx2nKopdBxXxkr40imGikbQrsJCm7oE/3thHw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V8ItFSTvQmWKAwQPAuH+4dAyBNxtaQKQQFslwoC+69TTothzoSpuYW4J568s2oAdCOuSZzbNxh+5pUJx2wP6q6NdR/+U6wfcZZeRtUTF3B7YDP1US2p672CCSdS04h9kTyNos1zHal2eJ+JggHuYlj2jsCtXFbxiUMoYauqzSZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=slwpgFU+; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <e20b0713-18b6-40e2-88d4-9a4cc8322048@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774957394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HsuuuruV3Ufjc3J3b63yx0b4a/ckqDaGKovYiLIwnIw=;
	b=slwpgFU+lKvS9pO5fuuvMGX8cgPVYvVUtY3iDJuO4/K/nnMPk0isgbizPiCVz/2FPKen23
	qxHmwiLVmsA2x1wqJgiUuJ15J5bUf51iDEg27GHsj3zBBDa5zsQTVIPERCUIMHGov4KgSm
	toXP+GAE1YRR9vWQ3ZesDrpV88aPr78=
Date: Tue, 31 Mar 2026 12:43:09 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 1/3] dpll: add frequency monitoring to netlink
 spec
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>,
 Prathosh Satish <Prathosh.Satish@microchip.com>, Petr Oros
 <poros@redhat.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260330105505.715099-1-ivecera@redhat.com>
 <20260330105505.715099-2-ivecera@redhat.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20260330105505.715099-2-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81834-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,resnulli.us,lwn.net,linuxfoundation.org,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,microchip.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vadim.fedorenko@linux.dev,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.dev:dkim,linux.dev:email,linux.dev:mid]
X-Rspamd-Queue-Id: 2DCDB36902D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30/03/2026 11:55, Ivan Vecera wrote:
> Add DPLL_A_FREQUENCY_MONITOR device attribute to allow control over
> the frequency monitor feature. The attribute uses the existing
> dpll_feature_state enum (enable/disable) and is present in both
> device-get reply and device-set request.
> 
> Add DPLL_A_PIN_MEASURED_FREQUENCY pin attribute to expose the measured
> input frequency in Hz. The attribute is present in the pin-get reply.
> 
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>

