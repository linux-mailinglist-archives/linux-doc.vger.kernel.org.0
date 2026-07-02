Return-Path: <linux-doc+bounces-94558-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xj3WMNA+RmrLMgsAu9opvQ
	(envelope-from <linux-doc+bounces-94558-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 12:34:56 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE806F5FAB
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 12:34:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=Pkxpr9q8;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94558-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94558-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4D9B304AC0F
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 09:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302E2480336;
	Thu,  2 Jul 2026 09:43:01 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46B746AECF
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 09:42:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985381; cv=none; b=JAxqHLZ8LM0R19CxeAKh85CaGLVZpOTkVfZUJfyT6PQtV8baLFEjGd/4IAEhtlcrj7vS+NkaUUoUp+PFF/jTXDCdR2TW6QmrwkUTKUC7Y5I65+OLxkCHlx5DO2ItZWGcvPrA+2jAKmJ6Q1tq4XG+1ykso/1nRqelLU3uJx1CVkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985381; c=relaxed/simple;
	bh=WHyRsImN0wk8YaiGT8diciE8CXWB3lmcC4uapP7I4pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9WOj6NJh2bczBb3v/YFjp1STOAIs3y3Ko1hlXiJFhYTpeBsVmOCBONcZg7MzHT3WVC0QyDI5l7T+fWbjG90DhbSBjAgykhwh5hNRDot7F2Wcvu5AvaCiXYI4uCgIDEgFTZYmDC7Q+oqdx1RQQfv+gNi2G/pSjRt7NDXcTuUZao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pkxpr9q8; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782985378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MRflcTqozd3yD192GPa9LVICDF8pi0TAiGk4ro5TDco=;
	b=Pkxpr9q8Fjkz88eKPUKM00UUYsipGzB4c2y5ww0GvwDyqWF6bSXZApNIqO/bkWUXo0LODU
	TgaxFw/by8f6fFDhzv3HjLoVl1JJ93hx/vDe8B78lJkI/c6Rug9aeXIapU5JmN9/eeRKTk
	OOvOy7+XjAOTuM3Q19Ssf3MtYmZfjuY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-62-z4WYYmpyN_Sb_RmhDFpTfA-1; Thu,
 02 Jul 2026 05:42:55 -0400
X-MC-Unique: z4WYYmpyN_Sb_RmhDFpTfA-1
X-Mimecast-MFC-AGG-ID: z4WYYmpyN_Sb_RmhDFpTfA_1782985373
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D0D21184B09D;
	Thu,  2 Jul 2026 09:42:52 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.48.252])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9B9D1196665E;
	Thu,  2 Jul 2026 09:42:47 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: illusion.wang@nebula-matrix.com
Cc: dimon.zhao@nebula-matrix.com,
	alvin.wang@nebula-matrix.com,
	sam.chen@nebula-matrix.com,
	netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	corbet@lwn.net,
	kuba@kernel.org,
	horms@kernel.org,
	linux-doc@vger.kernel.org,
	pabeni@redhat.com,
	vadim.fedorenko@linux.dev,
	lukas.bulwahn@redhat.com,
	edumazet@google.com,
	enelsonmoore@gmail.com,
	skhan@linuxfoundation.org,
	hkallweit1@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 net-next 05/10] net/nebula-matrix: add common resource implementation
Date: Thu,  2 Jul 2026 11:42:44 +0200
Message-ID: <20260702094244.111367-1-pabeni@redhat.com>
In-Reply-To: <20260630010718.4346-6-illusion.wang@nebula-matrix.com>
References: <20260630010718.4346-6-illusion.wang@nebula-matrix.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nebula-matrix.com,vger.kernel.org,lunn.ch,lwn.net,kernel.org,redhat.com,linux.dev,google.com,gmail.com,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-94558-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[pabeni@redhat.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:illusion.wang@nebula-matrix.com,m:dimon.zhao@nebula-matrix.com,m:alvin.wang@nebula-matrix.com,m:sam.chen@nebula-matrix.com,m:netdev@vger.kernel.org,m:andrew+netdev@lunn.ch,m:corbet@lwn.net,m:kuba@kernel.org,m:horms@kernel.org,m:linux-doc@vger.kernel.org,m:pabeni@redhat.com,m:vadim.fedorenko@linux.dev,m:lukas.bulwahn@redhat.com,m:edumazet@google.com,m:enelsonmoore@gmail.com,m:skhan@linuxfoundation.org,m:hkallweit1@gmail.com,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3DE806F5FAB

From: AI Reviewer <ai@example.com>

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev/
---
net/nebula-matrix: add common resource implementation

The patch adds the common part of the resource layer for the Nebula Matrix
driver, including conversion relationships among vsi_id, func_id, eth_id,
and pf_id.

> diff --git a/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_resource.c b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_resource.c
> new file mode 100644
> index 0000000000000..6742da7c66376
> --- /dev/null
> +++ b/drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_resource.c
[ ... ]
> +int nbl_res_func_id_to_vsi_id(struct nbl_resource_mgt *res_mgt, u16 func_id,
> +			      u16 type, u16 *vsi_id)
> +{
[ ... ]
> +	nbl_res_pf_dev_vsi_type_to_hw_vsi_type(type, &dst_type);
> +	*vsi_id = vsi_info->serv_info[diff][dst_type].base_id;
> +	return 0;
> +}
[ ... ]
> +void nbl_res_pf_dev_vsi_type_to_hw_vsi_type(u16 src_type,
> +					    enum nbl_vsi_serv_type *dst_type)
> +{
> +	switch (src_type) {
> +	case NBL_VSI_DATA:
> +		*dst_type = NBL_VSI_SERV_PF_DATA_TYPE;
> +		break;
> +	default:
> +		WARN_ON_ONCE(1);

[Severity: High]
Can a malicious or buggy Virtual Function (VF) trigger this warning by
passing an invalid type?

Because nbl_res_pf_dev_vsi_type_to_hw_vsi_type() returns void, it cannot
propagate an error back to the caller. When an invalid type is processed,
nbl_res_func_id_to_vsi_id() silently defaults to NBL_VSI_SERV_PF_DATA_TYPE
and returns 0 for success.

Should this function return an error code so that nbl_res_func_id_to_vsi_id()
can properly reject the invalid type instead of reporting a false success?

> +		break;
> +	}
> +}
-- 
This is an AI-generated review.


