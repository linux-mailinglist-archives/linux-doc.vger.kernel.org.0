Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F29DC134898
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jan 2020 17:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729550AbgAHQz7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 8 Jan 2020 11:55:59 -0500
Received: from mout.web.de ([212.227.15.3]:58745 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729062AbgAHQz6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 8 Jan 2020 11:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1578502552;
        bh=0WJzJsRib2NslA1Gvk0QnnumSOBmcT/EleQnHgaE5kE=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=nCwWqbOS9kx6ob0gubqCfQYLOk83Im1y2PBDgdKEZcCWldx9jO8Dh3V6bxvbIUO5L
         IU63AnvPNoVTD0ExL/8cIpSWpoSPDQxfMC5LzoIL9RXqJwNG7elSc5G3P9qxIur1iN
         1zoZPa4p/IrZLYNomIhIUl8Si5XvM5x/MgNs4+Bc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.64.251]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LtWsu-1jnyYe37WW-010sj6; Wed, 08
 Jan 2020 17:55:52 +0100
Subject: Re: Improving documentation for programming interfaces
To:     "Theodore Y. Ts'o" <tytso@mit.edu>, linux-doc@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Cc:     Enrico Weigelt <lkml@metux.net>,
        LKML <linux-kernel@vger.kernel.org>
References: <350cd156-9080-24fe-c49e-96e758d3ca45@web.de>
 <20191220151945.GD59959@mit.edu>
 <17931ddd-76ec-d342-912c-faed6084e863@metux.net>
 <748b8572-a3b3-c084-e8e3-de420f53e468@web.de>
 <20200108161428.GA263696@mit.edu>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <b8200956-47df-7714-638a-f78cb32a01dc@web.de>
Date:   Wed, 8 Jan 2020 17:55:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200108161428.GA263696@mit.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oBRitEzgIVKIIBbSUlMU4ttBnV/uOT1LoN1TpFo3vXxTALo+Tdu
 QqGAZ1Cu2pZbPR+OU4BkVv6cSsguR74iKCLRw1d3y3FBAdbvfREP4jH5nhbtjmtxwW+vu5H
 +TYaQWDyaDbhCXYZPdNDZxmxjFlotGx7MwiCUKb8UXvopZFEGjhJ8KvtFXfMq0kV7VFrlDn
 xpF2hMXCkfkBz5g541DZQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:44d7XezVC8k=:jGl3q8fv4cK2UKKotBIswk
 weeH2ECJuRUP5HSnv9q0ZhOL6cHT5pE9vsmCTEiR0a01Fq65zLwkOkqNh+/MNDI56VNmdJZiI
 nwRoqVpKx9/kLM0VP30m1PcDriklUQc7YKKDzEVMw5mebxP3QQe/zSG+oT6iL6uPd35amugzq
 T/AhkFBaeEhscxr2YxqhURNW3QXot9Xx+KQHw4jJLL+xV4SLZ34duTS7YeY3U1Qyd8yb9H4E4
 7FqCteWPZ57kfRHGQsCj15rhaxNJgdnPcLc7gfn70U1dgH5vdnsiI8PVOY6eZZo4DVqFAHp2k
 iHYXmooWre8FgAHMySzhMFM2vHLX1wKoG2wrZF7yeVfieUnHTG9QR3rL680UZeByY8QkGsN/F
 G6OU2Yh5V7iPWk9KMit63YA/P0QMpsBYczZ6xKzSwGi6rmlLZ6wj6myElaFV9SyJb0+J0+Gik
 +YyuODaWvIDlmMpequIuMwA5ytZZ10iFjQG+gK3JvBsv0BaKRQsLnTgunvntShiiMpBvoHUMS
 8P6qsm3CpKt7G17uDe4vf7/nqQ+7S9kxaRNAAjmglLzZ1kD0KBZNUTiKokTl61L5gHlWhhyHB
 jkm/mqlMBi3gpxM4Tyb/QpU7N0zEpLKeXOCPBbBISEToyKlAqP9rWqvVNIXR63xzEihv4fWPk
 q1h/WuEPw4otQHnPkkC3f63f4Rhj/of5Fb99DB3wnH+NLhvhEMfJsqBrKQ5ClYB1Nk/870tpf
 67dp9iUGTKtG7+xsO5/J1BYl5C4Edet4Kfm4hihme3ulck+l+hQDqaGpmnrd99rCwQPM//0k7
 gU1Pg4tv9seAQsYHnTxKj/rFyFrQVCSnGPTipkLM9hv0T7ZHSlit2GMp+d2RMdHJRhCDtWluK
 +a8+o2etLihgDGzeDSJR9VcuB25NGgwtqJqCgU6SSK9ZQ33Y+l7sHixjeF+LlF1reVIw4bBL9
 oVVr5K7CVbjWzsC5pkX2jY2z3fZlUkHE7BEme/VjrbC5L2aIOF6TWyol64ukvB0ghQkxCJXLt
 ZUh85HBELWeMF02l+s+c6++s/YXEDf7VMGnMN+olEkoTzLLKEEIwtn1/bdfURJcv1jZoMigYq
 3OKblPWKpoC5KrYZlyFEJpdegW6n2iVhGXfezhKjlgolw71TMvDU+GUdSge28EvBobcfhzEki
 wa0nqsTH7w5UFOpL9E2wb81U9X9Br356G6CST4SyNY7MyyWHDGrrxkezrZ3g6vJ/M+LN1PbzO
 kp11JrU7GkhOAdXUEDumZXHBRhntncFC64qcVi8Ai3+PMq23RRKuYaV8AXRk=
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

>> I propose to encode helpful information into macro calls as needed
>> for the C programming language.
>
> Perhaps it would be useful to for you to express what you are
> proposing in the form of a patch?

I hope that some of our communication difficulties on this topic
can be reduced also by other means.


> On the "benefits" side of the equation, is there are ways in which it
> will directly benefit the kernel developers who will need to review
> the patches and review the annotations, that can be demonstrated immedia=
tely?

Do you find a macro like =E2=80=9C__must_check=E2=80=9D useful enough to i=
ncrease
the development of further annotations?


> If the costs are very small, then the requirement for demonstrating
> great benefits will also be small.

Would you like to reconsider these concerns according to better
software documentation at all?

Regards,
Markus
