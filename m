Return-Path: <linux-doc+bounces-92265-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2JLFMHVyLWq/gQQAu9opvQ
	(envelope-from <linux-doc+bounces-92265-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 17:08:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2508267EDF4
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 17:08:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qq.com header.s=s201512 header.b="AR1a04Z/";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92265-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92265-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=qq.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF9A53022AA9
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 15:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A0F30D3FE;
	Sat, 13 Jun 2026 15:08:34 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out203-205-221-209.mail.qq.com (out203-205-221-209.mail.qq.com [203.205.221.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3AC2F3614;
	Sat, 13 Jun 2026 15:08:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781363314; cv=none; b=lNXUGo0PHJll7RTsgys2Mxk8VdRhtwdTcHJOGDTpfXsa+7jfizYV+rzPWDMY7rqMgEx1BAAm/6eTpPl81GJ8tBvlIFpjTJfCq+eRDjbe4ZuzZQElfavMPWfrZ8U0DhxIotoIYtczByf6bwyPyqrhJY1T7t533JLZfrFHKsWnX/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781363314; c=relaxed/simple;
	bh=9tJHIsmiB16UYTeCvyS8ahwRJcAYb8SWrmxsek0a/pE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kW8f4SNvgnnpITqvfusZq00h9xqDydXgocVvLbXs0zPn6qesjVgE2DrLIGsQrjKXsfXM7hGdn7SnA0BYRcrl4J+BZo0EQ5wJZ6Jj7jhZBSYYI/gfUPU93Xqx3Oe8ryIf3MyAWm4UGBDh1SKiFSJkqS7wBjfm1ehfCH0n+cp5X20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=AR1a04Z/; arc=none smtp.client-ip=203.205.221.209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1781363305; bh=jvXyb3bzqNSE4elaPGKJ70LFqYbQj0Y+Rp2uMVBChpU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=AR1a04Z/C1vVWXZ2mUvvuekckgioRoR60FgO0ZMrd/eqZiwz3Qgv065eFpKYWALcp
	 lQEIor31dKQ0NLCR075mTlKHs9k3/IFb7cXO2ci5H4E1HXdcbMRzcm52qaopif+LyV
	 C+jlpduqCNsjyvtSQvMGoqkshSW3h95iZX/12AFg=
Received: from [192.168.1.3] ([27.38.219.11])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 216072B9; Sat, 13 Jun 2026 23:08:22 +0800
X-QQ-mid: xmsmtpt1781363302tvn0usdb6
Message-ID: <tencent_EF8D392378BF3BBAB8583E67EDDDE51E950A@qq.com>
X-QQ-XMAILINFO: MTEKjEyAppcsqcXzMT4kLapHPPHoqsWGXxHqb+ubq1DCyCDrjFrtq+dXt/XGrL
	 mr/XkEgZhm/8aWGt/eFQlCrWQQBiptxWgPNG17owuKf5vt9m19tapBzxmKZzYJlKy7CqDzCxRuSW
	 BNyYgn3LURn8l1wIFz03JsHsr6h7SsbJUWgbIibmRan8VXBMQfVj3pnT7V5Yth29CCDzsnEkQf/8
	 QVLIp5BkA8C2nQA8lx1jSJjoyj54+UDXgVcT4R1893Bo9g4aLO3tuj5DyBUj7krGyjdmViuqio0I
	 7V8yovyhrAP+PlSzrNA1Jk7K0UQoTZOu47MCJfQNHgqOwSGWimPTkaLtZzCcUV9TH+vbW3agP5SR
	 5VeRfBNU/Cv8D54Nkj95BPBXNjmvf5O9jW5AaXFzEND+HFBWQlgwFziCSzZ5PsGNN5aYZRdaQXR2
	 sDCWb1QWiXRx4sCUtSZDzHWznLvEgsbVXA4SzhXL1um1fthiMU7/0z3hNYSBwp6MurBFi+ytmr/a
	 mFRbOuidhAlo8QmSmifYIzJK5h686Fgxox06OineOr1/tUeeUH8jUdh71kMUfSGKOpUIUvxjJIAi
	 T+OvK7tsgDlK/QyvjUzY4tXPXyvbFvysYem70FG0pmTUyTKysLN3VpZFwfTlb3cJcdZ8S4SmauB6
	 oMK4WeNGs+kmiwyt/MaobI/R2H47cg38ipAJ85f6g5i5XUrG2J082P+r6hZjc++jKCiuauFdjTgG
	 Nguhk3epEAU56iFhKAjqurBqHs+6zyi7pUBl+U2HUmvzwDlIO01Ncg/cNl2ZUtRcLiQzDKoAmJPp
	 5UGh9QbWkItpx8kfwJrKzF2IrTup9NiTVaLTs3P/KU14OO+SKK8fjQO87Z1P4tmpWxRT1f1Q3l5R
	 irwBoVvW/sF/zn1i6MMkHwQoxVX4Gshvx9aiNqqEkA2wiDF/JKU2P/wVwXYa2G483+k33UPx3nfi
	 4iehx62C7TTOPL7VIeR7k7EVd0+NgtEanIwdS3Gks0dmlpxSl4av819JUuEimyDj3lihyoYaKxiA
	 0YFCCrLYM25Xd1PmvtvfqjG7JwOmsXw0UctDeZn3puMXBd4cWcj91lE5geaUOtjlYyHScR2/I9zt
	 kPtVY9zMpFmO4ig35kWBoGduOzPB3q3FEYuvau
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-OQ-MSGID: <a2bf19bb-9e99-40b1-afb2-f6b08cab163b@qq.com>
Date: Sat, 13 Jun 2026 23:08:26 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] docs/zh_CN: add LSM/ipe Chinese translation
To: Fan Wu <wufan@kernel.org>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net, mic@digikod.net,
 dzm91@hust.edu.cn, skhan@linuxfoundation.org, gnoack@google.com,
 linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org
References: <cover.1781105672.git.zhuyan2015@qq.com>
 <tencent_DADDE291CA580302EB7BB40B83A552D6F006@qq.com>
 <CAKtyLkE3unhxMsH1LpqvjHQoKVgz1tcTsZWUxNHs+R6v2amf6w@mail.gmail.com>
From: Yan Zhu <zhuyan2015@qq.com>
In-Reply-To: <CAKtyLkE3unhxMsH1LpqvjHQoKVgz1tcTsZWUxNHs+R6v2amf6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92265-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wufan@kernel.org,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:corbet@lwn.net,m:mic@digikod.net,m:dzm91@hust.edu.cn,m:skhan@linuxfoundation.org,m:gnoack@google.com,m:linux-doc@vger.kernel.org,m:linux-security-module@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[zhuyan2015@qq.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhuyan2015@qq.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[qq.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FREEMAIL_FROM(0.00)[qq.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2508267EDF4

On 6/13/2026 10:54 AM, Fan Wu wrote:
> On Fri, Jun 12, 2026 at 8:59 AM Yan Zhu <zhuyan2015@qq.com> wrote:
>>
>> Translate Documentation/admin-guide/LSM/ipe.rst into Chinese.
>>
>> Update the translation through commit d7ba853c0e47
>> ("ipe: Update documentation for script enforcement")
>>
>> Assisted-by: Claude:deepseek-4-pro
>> Signed-off-by: Yan Zhu <zhuyan2015@qq.com>
>> ---
> 
> Have you tried to refine the AI translation? IMO some are really bad translated.

I have double-checked it several times and manually corrected the 
formatting and the accuracy of the translation.

> 
> Also how does the doc translation project work? I do notice there is
> another IPE design doc translation,
> https://docs.kernel.org/next/translations/zh_CN/security/ipe.html
> which has a wrong "original link".>
> -Fan

The documents in the "admin-guide" directory are intended for both 
administrators and users, focusing on usage; the documents in the 
"security" directory are targeted at developers, emphasizing design and 
development.

-- 
Thanks
Yan Zhu


