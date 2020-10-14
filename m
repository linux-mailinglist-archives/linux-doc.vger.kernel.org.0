Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 599B028DEF0
	for <lists+linux-doc@lfdr.de>; Wed, 14 Oct 2020 12:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbgJNKc7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 14 Oct 2020 06:32:59 -0400
Received: from sonic306-35.consmr.mail.bf2.yahoo.com ([74.6.132.234]:45170
        "EHLO sonic306-35.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726307AbgJNKc7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Oct 2020 06:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1602671578; bh=XwhqfvsLaPoE+EISCzullSfaZ4QzYpIGnpCOBzGFQBc=; h=Date:From:Reply-To:Subject:References:From:Subject; b=tH+7gItEZkf6E0/tcpRy6dIbsNjIC/j7GoQ4mdfxmqlTRTwYdKnmAasqwyf8ZDCgHmgyX4quHwn647HEwgUDl0bxaeCzWd4mXUF4ipwk6qrMnl0LL8lLVQauHleatNtS7lJqlGcKhR9xOrlENk05ZR9q60qeS/dJ3qu7nYNFTM8VpKrQp0U1Z6ToHKDjFsKW/JZoMyXAvSorwlqplpd6JzblivlS/nPMY3OMthb+ApQUz6ndK0xusY4gkMqH4+XcCMsXZZUIOEBNpDBA/6AjdYEE1zOZFswOC5KiATESWVyXU0o5GC1ffWI8FYAlao3SyQg/mXsKjr+iAjSPD6ovpw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1602671578; bh=PMmMdjHKhN+6KGtbCTqRpg9Xjj81hO/8Z/W6n+3v48s=; h=Date:From:Subject; b=fbQVHEeMqYAUSlealDoAPnWai2HB32W1cjwW9yq1LvKBH1JVSF8ug+brX+ON+zoh+0IdSzH+mX6c6MAUlDO+jmtnqZ5FPQZtht4SRBxiVoN7TMKyaqSH8P9izgoDlumHHZ65iqU/V+XkjC7BNJKfdY5Y6xwSR3tFO1ZqB53iBkwncWcxKQnYgXXOZ0YA2YkIpbix519IFa2Q7xMFJtXCZLMcV9+TMBV/sUWPrGeyt2FHJhCxVbn2ymOhW2XATenBonqJwsVrmpfrzjk52IpAKVSUKxhsOZwOYR31xnX6O69WcjJJHB3ZF1kFC/vfJ25q2D17r44Ehuq3q/j1AM74Dg==
X-YMail-OSG: YgMgLbMVM1mQNLsJtn_mP9r4sGwaP6aAQ3ztx4bZhuJ9YTU.rqXtIS.Ib6IgsPR
 qm1KlCU6Vd7jkUSe4BcoAERVc7qNsW.CLA7vYaZsP7vFpRpXtwzBDfa_RcFC0QDu9taqg4g1ObUI
 CdSOEUoVPtebZyFUKIzisRkZjcE79113FrqdSYNuCMR6C4wMoHcNdtJy8p_av3nqWEwYO7MSAfHS
 gVSMMp6SpGF91mlnLXfWmxdsPvWJqmL7BMVxeqJy12DDUIWozzwyplu9VXUxRCFez2unGnUX9GCl
 GB7lLY.8eT5_u3eMbMNMbNVEn4My1O3bpu5vGIwT75ROwzRluHwwuzqH.lWNBjiIy5EykDDutaW1
 jBFYFypri59DceSDFrC4zBQj6N.ccbA2mYGEIBnsna9k7.oWe2PKuykuLf5NciCZ2ro58gcwvOlm
 vlFkiSNwpWzkKYITJYqboW7gq_Z_0raee7aCJ_LPJOcUGeRuG9pjAEYR.jbRimIHMJ46BJF_VVEG
 NJOm4IrlFisJ.wA3pIkcqV_RbC89FzbVqS26ihz6S8TqgDYv8v5luHCUvBCffrgNce0axf4R8nnk
 doBgdflvTwocgVu5v.GSeBJPoPclXt0IXuvVjlRTuxHuK4owaV_0ogKY06Wxfap.23iB1MN5n7bp
 bHgan8V1LptNT3e7kz9DpBlhXMqsvtAw5dixSeGyMa_G2kqpA5JukAok1bKUFEk.lXwEnSAoT420
 MhMjtiXWsTuzr9H.m.XjkKpZLhVmEliOUKKuCgjGotj_nsr3m3UEVEyDnHftlsm20emgAyncWUtB
 bEfWFWSmhaNY0etIRVGo.lEE9V5n8KOZ5LZHSR2j2upQH_FTviRwfy8W9aoDi1h2Y26pGYSGKulQ
 mpFsqlW1dpwSqs9dpRYG3gMYvajLz09S9B6R9X_K6MYRKljh.tXwVTixQhAWd2m3TbO.oDTI4raw
 6kpd_l3lX5batnuPVqG_1Rl4N.wOzgdVrvVUo4M1QNGCKuhjzrkLBIDuSwng8Wl_t62UhVcPmTDm
 S3aqCdprU8XCfDyt8wmehHp7GCmEUI.1W9OJzxiNNC8e.WODoZDTB7MM2r12XTdypMLOkmzozNI0
 .3.lVg7Uiy2f6jg6g737b3OFWsI6oEm6sYKsv0UMyDWNoxxX2eA5tDkkWfM8YnogZNihHMLLZA3I
 sRaeVz3QZo5LKiaPAI1BwEHw5mNJZ89N9uHTCgLGhGwEZebMTrCoJWNrrZ2IbT6eNt8FquHIyjcm
 xN7vLKtoXiuWhhb_As4HwPGNAWQXT3m7itS6W1xvRUsVzio9_ldrmkrjS7jbIvs8RuouiAC3TIng
 wSGcfqNgYbmCO4Cnb.yL4Gn9gmNyQ6hAnVWwZBMlzevKeQEl0qYWnuOVHg4z.jR0B0.HxPgITM2P
 mmfTgsasEMJD4vGaFT1IR8glIppCINBR8wXGyoAFcQ01MKkKsXwsKu1tCvv.K51aFaRRMAqiu2w-
 -
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.bf2.yahoo.com with HTTP; Wed, 14 Oct 2020 10:32:58 +0000
Date:   Wed, 14 Oct 2020 10:30:57 +0000 (UTC)
From:   Lisa Robinson <lis10@gdxcm.in>
Reply-To: roblisa084@gmail.com
Message-ID: <1200057936.359394.1602671457819@mail.yahoo.com>
Subject: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1200057936.359394.1602671457819.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16845 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



Wen es betrifft,

Ich habe mehrmals versucht, dieses Konto per E-Mail zu versenden, da Sie f=
=C3=BCr die Teilnahme an meinem Wohlt=C3=A4tigkeitsprojekt ausgew=C3=A4hlt =
wurden, um pers=C3=B6nlich Geldspenden zu erhalten. Nachdem Sie diese E-Mai=
l erhalten haben, kontaktieren Sie mich bitte so schnell wie m=C3=B6glich, =
um detailliertere Informationen und Anspr=C3=BCche zu erhalten.

Ihre Antwort wird eine Seele in Ihrer N=C3=A4he retten, und bitte lassen Si=
e uns diese Welt zu einem besseren Ort machen.

Sch=C3=B6ne Gr=C3=BC=C3=9Fe,
Frau Lisa Robinson
Copyright =C2=A9 2020 Lisa Robinson-Stiftung. Alle Rechte vorbehalten.
