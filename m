Return-Path: <linux-doc+bounces-77280-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNnrGWLqoGnynwQAu9opvQ
	(envelope-from <linux-doc+bounces-77280-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 27 Feb 2026 01:50:42 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEDF1B14FA
	for <lists+linux-doc@lfdr.de>; Fri, 27 Feb 2026 01:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D6F2301A9FF
	for <lists+linux-doc@lfdr.de>; Fri, 27 Feb 2026 00:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DA1283CBF;
	Fri, 27 Feb 2026 00:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDQZhGuR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E82281370
	for <linux-doc@vger.kernel.org>; Fri, 27 Feb 2026 00:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772153439; cv=pass; b=Ii43/eKkXrXhdg5Yyyxo3Y7tCkY9+7XeRENovNTW3THeK5s+BNHg5jtSGLmpNsrQb1N88+5A9ZHz0oPjtvS5HW6QQEg5m1eersmYh2m/CVrRGjJPUW+OcR7bQej2DpOwqwuXaX3EcPMPmqeXADZkqefMNzf2vjuiiXgMZFPuv7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772153439; c=relaxed/simple;
	bh=Uf+sscOR+yuFgtYwpJVpmYCu25jcP+Fzfo2M5z6qkJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MHcJHy70j7SoLvCIVCDof7Zcg2Oa96VFJDNRQO0GkD0kP7D/vuvk6HkNjMZCot3mlTx0/sfFsocUssWpvW9oH5zrGN62PNVSVf3hgeaRepIfBLymNLi0E2uJwv6eokarFM9osBvSqY+iWZeuwzot7XkDIfwXraNwBFothUfgGsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDQZhGuR; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65f771c6b89so2280783a12.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 16:50:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772153435; cv=none;
        d=google.com; s=arc-20240605;
        b=N46VvkXVfVgEop7zc7msrd+m2uVbw4j3JEEulX9ttNRyPDCGU6IelOxssKk7P/OAPu
         SS2qZU7dMZ2ErIbdyjj6Qs+zUwH7ZUN+0FflRC++Avlcpo93T/2v1zZ15P/O7fFGDI4d
         ZaQGuD1zSMrZqWWRwlZxO02SDHp2ugfshvDZ15AUPCv8RwQTBTFtYm/1zvYll4B8U3rz
         F8t+7ynhbhMeknJzDJ+NzSNTbg+utwZZ34UfB0ZHwmm/92VTr7qRPlzallSDiFNp+THT
         btIoT+Wi3JRvUqEKJGIlVy7n3r6lMrz1bSNDCANT5ltlKkfiokNc8pmGFt+lo+a1b0J1
         Ajcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XL+FmmWPFy+JjiNeiu6vxWROsh3ZKDuEY/7VIpcd5Cc=;
        fh=yLC0SFXzQMWSXjAAHnFkoorUIPYcrF0EjQPQMbEUksI=;
        b=e2svYCDAuhOvFbcOkquoG5/rVpPfOhVFURlN54MO/IWe6ELsoK810ygcI8VLETv1H9
         AR8cf+IFyXpLWhn+SgvES0EFdFJ9P1TCtox7A7B+d01/NvhnjLYjUkx0A6PckveioTJ2
         Gs2Gr40+MrEHcuO359sxyYXlx0C3m/a0PCK0HKvVnpVkahzb1+NLeVzBtjOjZGXCJE1H
         qv6J8NmI8ycZhs2PwhOqUHpzByPGOhmxkgNZMlHvXjz/oC6Y1pRbTysjoSj03tkUjd8r
         RkbgR1O68+2x5O/gNLWIpGwrOfV3WFwjuI39UgpF9vEzILFU2vgS/lzDaoB6ZJcS35y8
         LTkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772153435; x=1772758235; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XL+FmmWPFy+JjiNeiu6vxWROsh3ZKDuEY/7VIpcd5Cc=;
        b=cDQZhGuRlrDPL2edlRfqqpl45u42Q4/nqem+vDxFCZ7u9B/282b2hvcJKT9JoZ54A2
         XZ+dqBElwhhkKkQXjQY0MthBNpS0/rJobgNQWoCaF+O7ejgDDnlomcPbEVZEd7juzk/Y
         rjlGmH6x5V6MtKAJmkxEPF+flpYzRYJV6SYImqfTJBDr6mwxtD+3fELJC+Nqdmhy6FoW
         J5e6hB9ValdG7hCFVa4MnnowsaDJ4ziNsCTUaGkvvD8ju1w4z/qUXkrmEOeZRlFkRkqx
         UB82Edz/UMlgyOecEL9ViFBOWX9wP3+DiPCOqgYODQcdl+bO8UtmrsrV1azsUXp4xe39
         oKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772153435; x=1772758235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XL+FmmWPFy+JjiNeiu6vxWROsh3ZKDuEY/7VIpcd5Cc=;
        b=K1QdeC9RG+s6s+fB/MBaAbzFXG8f2iFZD+0TMEzGVvS7r/AZpS0SuJh9TOYodvCpv9
         oORJYJ9Z4F3XeCrrQKzETDK4ianfU0kruQnkDDhlFrIvBqPmEgwgHbrgCvNEdfCbs9RZ
         Tdw5iknB30ePfft6tGTUcTH3sV3Hvv/nMmaLMbI6MUn/PBMqAvGi9pCnzyLGw3HJS/R4
         B7oZpl6Bl36WcXFNCwuwed5ygKnhPbkq7jtSuAUVVepd9BD9M1as5HH2pevtoDKaN4OX
         pKWba4Ab+0PjAdXvRD7X2MjyIwf1EBbImy2lyema63Aob7VOoNT2qrAOsT0MhO8sOeqq
         3bHg==
X-Forwarded-Encrypted: i=1; AJvYcCXJoEjYXPkz7UBzFdmsfmYQUl9eXFjK6gafQB4M4dpvNRy639gJn6iCA1KZO8S9ktpDWpxTg9waK3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ00Dxv1y+gBLz/uaEFQ/AYiPRAszmUnZTCvEYk/zPRjK2cq7F
	iH1zplSnOVt/ZE6Ttz4XWk6RPooUP/5tirwdTi4cmEWNsGEbLths8z3GJLuvmiI1vDpRZdf1sO8
	YMjh6zPPT/BiM5a1b/gfpI3Mx/q2JAcg=
X-Gm-Gg: ATEYQzzZ8hOH9mDIXkFkw/GWXqsemqXahz67PoqRLhGAsXKjNWrHCmocPbqRTrwDNks
	NQtN7OyuhaHaBtcD7PGRQiAfH1IFK4wr5NqXgnD7vzNCqsqNqLPas1ugR61MaFGkyBnj2aINzXA
	aI2PfPO1F9l77Z3UqUhsSuoRnvuXw5rpTSkt1OIzYIAZxucN9+Opg7cTGWULK2eXIbqObBJVfyp
	NYhGZYtdOPD30cp9J2OQms9xo3RaWQS24UTSvqKjb7RDALPPg1/tL5NQtbIkxyofJYEx7g3BroW
	iCBg9Dn4LWl3d+UZxTM0qh6LneA8ihzGGTcW4A==
X-Received: by 2002:a05:6402:146f:b0:65f:a428:e008 with SMTP id
 4fb4d7f45d1cf-65fdd4cb0c4mr709096a12.5.1772153435063; Thu, 26 Feb 2026
 16:50:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227001151.41610-1-leon.j.kral@protonmail.com>
In-Reply-To: <20260227001151.41610-1-leon.j.kral@protonmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 27 Feb 2026 10:50:08 +1000
X-Gm-Features: AaiRm50jOH2clR6j9tf_ctr7L0PK_VdWJqSq13o2tmjs5iaKJMGoWPOcsuwangw
Message-ID: <CAKmqyKMxnBkBeKwA0qevmNH2m9WOjOHRV6DiUOTjyz48SBwYtA@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net/handshake: Fixed grammar mistake
To: Leon Kral <leon.j.kral@protonmail.com>
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net, 
	chuck.lever@oracle.com, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, netdev@vger.kernel.org, 
	kernel-tls-handshake@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-77280-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alistair23@gmail.com,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,queasysnail.net,oracle.com,davemloft.net,google.com,redhat.com,lwn.net,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,protonmail.com:email,wdc.com:email]
X-Rspamd-Queue-Id: 0CEDF1B14FA
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 10:08=E2=80=AFAM Leon Kral <leon.j.kral@protonmail.=
com> wrote:
>
> The word "a" was used instead of "an" which is grammatically incorrect.
> Fixed by changing from "a" to "an". This improves readability of the
> documentation.
>
> Signed-off-by: Leon Kral <leon.j.kral@protonmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  Documentation/networking/tls-handshake.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/networking/tls-handshake.rst b/Documentation/n=
etworking/tls-handshake.rst
> index 6f5ea1646a47..4f7bc1087df9 100644
> --- a/Documentation/networking/tls-handshake.rst
> +++ b/Documentation/networking/tls-handshake.rst
> @@ -7,7 +7,7 @@ In-Kernel TLS Handshake
>  Overview
>  =3D=3D=3D=3D=3D=3D=3D=3D
>
> -Transport Layer Security (TLS) is a Upper Layer Protocol (ULP) that runs
> +Transport Layer Security (TLS) is an Upper Layer Protocol (ULP) that run=
s
>  over TCP. TLS provides end-to-end data integrity and confidentiality in
>  addition to peer authentication.
>
> --
> 2.53.0
> v2:
> v1: https://lore.kernel.org/netdev/20260226000915.27898-1-leon.j.kral@pro=
tonmail.com/
>
>

