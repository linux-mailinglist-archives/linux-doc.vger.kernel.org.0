Return-Path: <linux-doc+bounces-81836-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNv9L/mzy2kpKAYAu9opvQ
	(envelope-from <linux-doc+bounces-81836-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 13:46:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 62861369056
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 13:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 934C030276F0
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 11:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9FB3E022B;
	Tue, 31 Mar 2026 11:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fkYG71kO"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB1C3A9D87
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 11:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774957558; cv=none; b=e+o2uZJzwWsXjTWjnUzrO8WY61q0H8oSTaC+SlDua/rNttwkvEjc59SfbzuR3pypAeh7O8ZXmPdftrgPmR3q1EpxE7XfsJuVP5a4eDGqUd8T9M06lbB+nbs4c5/J3yTw0maVkrR/uE8XDU0bHqSgUE4n9ZUnUEG1dVKfMYv0apo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774957558; c=relaxed/simple;
	bh=OUYgSyX/AmDPuYbf1y3UWqD6X57Ff9v32jLUL2uOyvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVOks9Z//cFfz6G3Xe4CDyiwu9keOuv9o8kUzo5aeGViYkNzX469DWMYMombA2HfpEMDCtcmmJ1NU9DtOoA5DifxiqiZV0UaNPFuUnI3iKcjxVIAf0Sv1/hPlj1Q0utGjnEC40O+Bd1IQklUpRh4hWK3eEKkGRJbeEEEtBtH6ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fkYG71kO; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <a7a044ba-5235-42c5-b6f3-6f23d9724b67@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774957555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ReF17fCkadAbkp2YDOZfTTfqawmF9ZRpg/8RnG+xBo=;
	b=fkYG71kOnHTFHNodR2v4naruaqj+qjIgN90zJjNgxNLRAHHRmWPMT2y+0FS1b2LfWLh94+
	ZxA64KxRdIHUKVKzYSeMHpQEx0fViy4F6wYlIxWHhKMCWHRbIfQVkxxPWwHJs4dM0p0Q79
	H/rCAjL0jTOf2sGW3AxuBvcrn+jyOGc=
Date: Tue, 31 Mar 2026 12:45:52 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 2/3] dpll: add frequency monitoring callback
 ops
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
 <20260330105505.715099-3-ivecera@redhat.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20260330105505.715099-3-ivecera@redhat.com>
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
	TAGGED_FROM(0.00)[bounces-81836-lists,linux-doc=lfdr.de];
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
X-Rspamd-Queue-Id: 62861369056
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30/03/2026 11:55, Ivan Vecera wrote:
> Add new callback operations for a dpll device:
> - freq_monitor_get(..) - to obtain current state of frequency monitor
>    feature from dpll device,
> - freq_monitor_set(..) - to allow feature configuration.
> 
> Add new callback operation for a dpll pin:
> - measured_freq_get(..) - to obtain the measured frequency in Hz.
> 
> Obtain the feature state value using the get callback and provide it to
> the user if the device driver implements callbacks. The measured_freq_get
> pin callback is only invoked when the frequency monitor is enabled.
> 
> Execute the set callback upon user requests.
> 
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>

