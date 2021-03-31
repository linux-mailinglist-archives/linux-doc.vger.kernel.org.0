Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4915E35098E
	for <lists+linux-doc@lfdr.de>; Wed, 31 Mar 2021 23:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbhCaVeD (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 31 Mar 2021 17:34:03 -0400
Received: from fallback16.mail.ru ([94.100.177.128]:60800 "EHLO
        fallback16.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231488AbhCaVdq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Mar 2021 17:33:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail3;
        h=References:In-Reply-To:Content-Transfer-Encoding:Content-Type:Message-ID:Reply-To:Date:MIME-Version:Subject:Cc:To:From; bh=xvljl3Jk2U7pvHM/gpWO8hgtSqcvNOOYcg5NVgFux1w=;
        b=t1gW0+PVz8hgB74UMlnvc2Z8BbwITj4Bokjn4f3WlYOj3Twb68lo+jaAHN7f1K1t9SBjMTsJnr7ggrfxzg9OCE2c1xlP8gqDixCa680E++pZhJOCcNkklpC+W8xyLWFzyVcrHrpMz+MTkLmeD4UIzs1fJmvlgzOpXcChJvyC3gU=;
Received: from [10.161.163.42] (port=37040 helo=f480.i.mail.ru)
        by fallback16.i with esmtp (envelope-from <safinaskar@mail.ru>)
        id 1lRiTA-0006ol-Pf
        for linux-doc@vger.kernel.org; Thu, 01 Apr 2021 00:33:44 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail3;
        h=References:In-Reply-To:Content-Transfer-Encoding:Content-Type:Message-ID:Reply-To:Date:MIME-Version:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=xvljl3Jk2U7pvHM/gpWO8hgtSqcvNOOYcg5NVgFux1w=;
        b=tqFNfXdv/9hOYKnsE4s8BYmEaeQcJs52HK3OyNTVhs4jjtRA5/aLpULTEceRMZPOjQh22mLMVaXff4OCOBHZCorhbTUviTPsbQsdz8yrf1Jqe4zaHhGE5bHGsnMa1ASb+2cMil6QTN5bWb79rFE0kR8uutWa0cbTex7F0h/EZVA=;
Received: by f480.i.mail.ru with local (envelope-from <safinaskar@mail.ru>)
        id 1lRiT6-0007nI-RF; Thu, 01 Apr 2021 00:33:41 +0300
Received: by light.mail.ru with HTTP;
        Thu, 01 Apr 2021 00:33:40 +0300
From:   =?UTF-8?B?QXNrYXIgU2FmaW4=?= <safinaskar@mail.ru>
To:     =?UTF-8?B?Sm9uYXRoYW4gQ29yYmV0?= <corbet@lwn.net>
Cc:     =?UTF-8?B?bGludXgtZG9j?= <linux-doc@vger.kernel.org>
Subject: =?UTF-8?B?UmVbMl06IGRvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvcGF0aC1sb29rdXA6?=
 =?UTF-8?B?IHJlcGxhY2UgIlRoZXNlIHBhdGhzIiB3aXRoICJVc3VhbGx5IHBhdGhzIg==?=
MIME-Version: 1.0
X-Mailer: Mail.Ru Mailer 1.0
Date:   Thu, 01 Apr 2021 00:33:40 +0300
Reply-To: =?UTF-8?B?QXNrYXIgU2FmaW4=?= <safinaskar@mail.ru>
X-Priority: 3 (Normal)
Message-ID: <1617226420.857151766@f480.i.mail.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
In-Reply-To: <87v997jcsk.fsf@meer.lwn.net>
References: <1616546322.499771404@f511.i.mail.ru>
 <87v997jcsk.fsf@meer.lwn.net>
X-7564579A: B8F34718100C35BD
X-77F55803: 119C1F4DF6A9251C54E3E0C6C5F9D9413389E36CD4AD6D26B23214BF37ADDD15ABF6EAE57C0FACE9644A9A743E0CADD0700D349EC4FD75C3D17234C17141B0B3B4A12753EE067DD2
X-7FA49CB5: 70AAF3C13DB7016878DA827A17800CE719630BE8CA1034E8D82A6BABE6F325AC08BE7437D75B48FABCF491FFA38154B613377AFFFEAFD269176DF2183F8FC7C05644E22E05AA81AEB287FD4696A6DC2FA8DF7F3B2552694A4E2F5AFA99E116B42401471946AA11AF1661749BA6B977350240200614025CBB8F08D7030A58E5ADC58D69EE07B14084C6CDE5D1141D2B1C6ED0126A3A5AB16D0C76218560CD495DAC1BAF51C07162889FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B974A882099E279BDA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249B372FE9A2E580EFC725E5C173C3A84C31BC22E60DA9664CB089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-B7AD71C0: AC4F5C86D027EB782CDD5689AFBDA7A24A6D60772A99906F8E1CD14B953EB46D7346F5175D3E0671355D89D7DBCDD132
X-C1DE0DAB: 0D63561A33F958A5C32405C5EB31CF588D6132D351E0D3D565A82890C40AEC32BDC6A1CF3F042BAD6DF99611D93F60EF4280523C145DA091699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34C2BE7381A0AD3DF1597F4154D26B915B637CBEC495714C6095D29FB2846895B43ACEAF98D2BD97231D7E09C32AA3244C66917BB8B5A98D2DE2A4A12391AC457935DA7DC5AF9B58C0729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5+wYjsrrSY/u8Y3PrTqANeitKFiSd6Yd7yPpbiiZ/d5BsxIjK0jGQgCHUM3Ry2Lt2G3MDkMauH3h0dBdQGj+BB/iPzQYh7XS329fgu+/vnDhl0YfZUulEOD6+VarhlxFGg==
X-Mailru-Sender: 583F1D7ACE8F49BDD1A7C3169173243B809A8543EE23014891BF53AD01BD8BBA98CCD8D5CB1CCC212638FEAFD496B24D3919A3F0584408A7E277D648EEF17123F32B7A1AD1AAC36A3BEC1D9798BA4B85D186BC2F9B8D6AD3EAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Spam: undefined
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B4DF7173A40FF1347DA6106AACE9855D497B195A79B23E2D14049FFFDB7839CE9E06A57B16D08E84888E0DE9265CDB13FEB87F4770C5391EB3E3605DA0E1799F35
X-C1DE0DAB: 0D63561A33F958A51A59823B2E5800F23192F4D2AC438AA83A8723C60A9E2BFED59269BC5F550898D99A6476B3ADF6B4886A5961035A09600383DAD389E261318FB05168BE4CE3AF
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5xhPKz0ZEsZ5k6NOOPWz5QAiZSCXKGQRq3/7KxbCLSB2ESzQkaOXqCBFZPLWFrEGlV1shfWe2EVcxl5toh0c/aCGOghz/frdRhzMe95NxDFdM/HWZ2FZeTebxBM20IwEYg==
X-Mailru-MI: 800
X-Mras: Ok
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

PiAiVXN1YWxseSIgZG9lc24ndCBzZWVtIHJpZ2h0IGhlcmUgLSBpdCBpbXBsaWVzIHRoYXQgdGhl
cmUgYXJlIHRpbWVzIHdoZW4KPiB0aGF0IGNhbm5vdCBiZSBkb25lLiAgQSBiZXR0ZXIgZml4IHNl
ZW1zIGxpa2UganVzdCB0YWtpbmcgIlRoZXNlIiBvdXQuLj8KV2UgY2Fubm90IGRpdmlkZSAiLyIg
aW50byBmaW5hbCBjb21wb25lbnQgYW5kIGV2ZXJ5dGhpbmcgZWxzZS4KCj09CkFza2FyIFNhZmlu
Cmh0dHBzOi8vZ2l0aHViLmNvbS9zYWZpbmFza2FyCg==
