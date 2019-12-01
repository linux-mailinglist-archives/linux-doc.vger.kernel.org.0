Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEFEB10DFFC
	for <lists+linux-doc@lfdr.de>; Sun,  1 Dec 2019 02:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbfLABDF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 30 Nov 2019 20:03:05 -0500
Received: from ms.lwn.net ([45.79.88.28]:36268 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726188AbfLABDF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 30 Nov 2019 20:03:05 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B0D3730D;
        Sun,  1 Dec 2019 01:03:02 +0000 (UTC)
Date:   Sat, 30 Nov 2019 18:03:01 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Git List Mailing <git@vger.kernel.org>,
        Junio Hamano C <junio@pobox.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Jonathan =?UTF-8?B?TmV1?= =?UTF-8?B?c2Now6RmZXI=?= 
        <j.neuschaefer@gmx.net>
Subject: Fw: [PATCH] Documentation: networking: device drivers: Remove stray
 asterisks
Message-ID: <20191130180301.5c39d8a4@lwn.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/gdOMqLR7kgg3VNU=OkOZWXz"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--MP_/gdOMqLR7kgg3VNU=OkOZWXz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

> On Sat, Nov 30, 2019 at 4:14 PM Jonathan Corbet <corbet@lwn.net> wrote:
> >
> > So my tooling is "git am", nothing special.
> >
> > All of the afflicted files arrived in that state as the result of a pair
> > of patches from Jonathan (copied); I have verified that the original
> > patches also had the DOS line endings.
> >
> > The problem repeats if I apply those patches now, even if I add an
> > explicit "--no-keep-cr" to the "git am" command line.  It seems like maybe
> > my version of git is somehow broken?  I have git-2.21.0-1.fc30.x86_64,
> > FWIW.  
> 
> Hmm. I wonder if the CRLF removal is broken in general, or if the
> emails are somehow unusual (patches in attachments or MIME-encoded or
> something)? Maybe the CRLF was removed from the envelope email lines,
> but if the patch is then decoded from an attachment or something it's
> not removed again from there?
> 
> Can you attach (not forward) one of the (raw) emails that shows the
> problem and keep the git mailing list cc'd?

Attached.  The patch itself was not an attachment, but it was
base64-encoded. 

jon

--MP_/gdOMqLR7kgg3VNU=OkOZWXz
Content-Type: message/rfc822
Content-Transfer-Encoding: binary
Content-Disposition: inline

Return-Path: <j.neuschaefer@gmx.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on ms.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE autolearn=ham autolearn_force=no version=3.4.0
X-Original-To: corbet@lwn.net
Delivered-To: corbet@lwn.net
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPS id 334B7491
	for <corbet@lwn.net>; Wed,  2 Oct 2019 15:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1570029020;
	bh=yUFTg6ZxVsRPJtAKQ3gX0rVRw8VfaNcYgPysvunYjPY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=eJSLA4Bqi6o90j1QFhXoF9RXZBz0HH4AEviSFGEjvepC59vVH0CU7f+epndlP1tkt
	 xFQWMd9r/Efy7ud3ZS3cb6/M52ite6n7EtLcHOgf+dg/SBkej7TDiNBEbEVjq7XF0i
	 NVBZbYDi5KPDG6C1aTsP79Oa7nI/twtTHAPcEU5g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([109.90.233.87]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbRfl-1hioI11mmn-00boWM; Wed, 02
 Oct 2019 17:10:20 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shannon Nelson <snelson@pensando.io>,
	Pensando Drivers <drivers@pensando.io>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: networking: device drivers: Remove stray asterisks
Date: Wed,  2 Oct 2019 17:09:55 +0200
Message-Id: <20191002150956.16234-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:CWh4l+vL9i+95dZVZ/4GRuwCc6GblO8I4L9tDuzTRv+tmLw7Wqp
 j2ImKw8BY4YaEOcnrf8mLKDk2viiZZjOTbNQilUwnv8X4FEmvkeN6aWu9et1+lMJSO+1LAT
 Pw8/UNOi+6A54xQxQPtbr+ZkPP7ouHVGx+HAe1w5ebTTlqCUFvf8k+ltMrPjTqWPCbQh4Rr
 kyJ8pVR/Si/NmhapKefMA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GBsls17Eo8M=:sB1bgHB91rKFTQMCXyZsqD
 KEiVgX2g7MqfFsN8bqQZ/SnGlwiSQY6cEKCrYV7DTlS4bqh8F67C5J9Uunjvxdkq9M1TBTThg
 /GDsSZW8muqmU9/K13qvs8RaWPZgy7HBrjv0Fou5ncAdcV9qgt37i97uOu+Z1hD9Xp5BX45f7
 fDJb3PA7bqizFttClKREjXtrr0HWlw2rxTQt20AwOut86ekxBjNzq60euoNJbZlr0SFRttr7L
 OIqjICai+mfTYhUCtqSpVQ4kmx2gV5jDHa+YOB1w+wpB2VfhWasYSugJV316UAhtiHx28erc+
 aVDeTERf9NWp6H3H05SUJBPr1h8qOBgo4gThzsgCKSz+3ZwSruRt8ZTLtQtTybeHPkwDXVapU
 nUPgOkWUlINhJrfjgi1qoXiLngSpIoTlzzqNaWEbLX/XKcH7OwjSX0g9DjDfw6TVSvtCCSZDI
 8hHBElaKcgRYSytpX3ok6IeYS3c+CY/jzRj3kfBEXSnG1dq31oRoDWVVZsIiHVkUAzIP4Z/2K
 EDooShCV/ZzkeuDqjssWJgAoMAFHumB8lq1KllAIYVXvwR86Ag8902bBSSu5ed5ulOHVNyI5a
 mAVQbjcuRshXTl8KWqn1oXAd8bzufqrDP8cocqzzD8Irg1qPoacwMGgyD5h0Z/xTzvoLvWmvX
 t2UzdebUdF2/v7ijZi61l2kttmBK26BeMgWYuOvlQimoUoU02wyC+vQrbyuTG9yMz66MbMbyq
 9UOOJmQsYUZCiaLxQsQsmzj+wS3nHDtb0yPktWRYrI0zhXS8IFCyB/Pu6nNul6dioDWH8GN/D
 w9+EE5EIO5J3G09Cf1LNSL4g7ZhLyFKKIZyrphpAm0+gmHcQ/5lZXxUmIxgu6wbbQ0eyBXqhv
 kF2j4mWt7Ut74bfEffRLSQp/iCk9aSSWT5DfQAGpoh+llXWIu5H34sLwIEqZqqcmxAxvbfTyU
 mjO+ZzT8HhhIme8M41MPzXxx5DTO0rYy1cO88c0cDACblWoYI8MuPDFQJnarZMiYOFcEdY0d+
 AU1rya9tpD6iyUTWF+y7YCMPbuLuE2kBkt23lF4YdSJuqQnmUPIjMUPrSIja6+HpCX/wliihj
 JUBhZX/7QV3eq06WrC09CpxhFG15mJ7jAUe1Obcfbd23CDm2X6HO106qZcG4CzRNKqHBjLkax
 iBcAmhX4o2Ipe6QtOTEqeABgrw+CG7mPNRUpmvVyAb80fpJtmW1tTGRNIDPGGFOrLDiblwR0P
 Jbyxg1UfjJsPoAoKa1k80VrypGaCVx7ktG8uhYJo5Zu52YnzmGSP75tl790QB0e8cUsmvBDq2
 zLbGDHWBCeK7dkE3RvaeTs8OqWT9vJfVj9c0rZ7FesQ/iEWGCPbI8hhnp/gbUlkwUQYq4dOP/
 JCMytwJuksrE5R5uPO5a2NUdFFaef5kIa9xne71TtI=

VGhlc2UgYXN0ZXJpc2tzIHdlcmUgb25jZSByZWZlcmVuY2VzIHRvIGEgbGluZSB0aGF0IHNhaWQ6
DQogICIqIE90aGVyIG5hbWVzIGFuZCBicmFuZHMgbWF5IGJlIGNsYWltZWQgYXMgdGhlIHByb3Bl
cnR5IG9mIG90aGVycy4iDQpCdXQgbm93LCB0aGV5IHNlcnZlIG5vIHB1cnBvc2U7IHRoZXkgY2Fu
IG9ubHkgaXJyaXRhdGUgdGhlIHJlYWRlci4NCg0KRml4ZXM6IGRlM2VkYWI0Mjc2YyAoImUxMDAw
OiB1cGRhdGUgUkVBRE1FIGZvciBlMTAwMCIpDQpGaXhlczogYTNmYjY1NjgwZjY1ICgiZTEwMC50
eHQ6IENsZWFudXAgbGljZW5zZSBpbmZvIGluIGtlcm5lbCBkb2MiKQ0KRml4ZXM6IGRhOGMwMWM0
NTAyYSAoImUxMDAwZS50eHQ6IEFkZCBlMTAwMGUgZG9jdW1lbnRhdGlvbiIpDQpGaXhlczogZjEy
YTg0YTlmNjUwICgiRG9jdW1lbnRhdGlvbjogZm0xMGs6IEFkZCBrZXJuZWwgZG9jdW1lbnRhdGlv
biIpDQpGaXhlczogYjU1YzUyYjE5MzhjICgiaWdiLnR4dDogQWRkIGlnYiBkb2N1bWVudGF0aW9u
IikNCkZpeGVzOiBjNGU5YjU2ZTI0NDIgKCJpZ2J2Zi50eHQ6IEFkZCBpZ2J2ZiBEb2N1bWVudGF0
aW9uIikNCkZpeGVzOiBkNzA2NGY0YzE5MmMgKCJEb2N1bWVudGF0aW9uL25ldHdvcmtpbmcvOiBV
cGRhdGUgSW50ZWwgd2lyZWQgTEFOIGRyaXZlciBkb2N1bWVudGF0aW9uIikNCkZpeGVzOiBjNGI4
YzAxMTEyYTEgKCJpeGdiZXZmLnR4dDogVXBkYXRlIGl4Z2JldmYgZG9jdW1lbnRhdGlvbiIpDQpG
aXhlczogMWUwNmVkY2MyZjIyICgiRG9jdW1lbnRhdGlvbjogaTQwZTogUHJlcGFyZSBkb2N1bWVu
dGF0aW9uIGZvciBSU1QgY29udmVyc2lvbiIpDQpGaXhlczogMTA1YmYyZmU2YjMyICgiaTQwZXZm
OiBhZGQgZHJpdmVyIHRvIGtlcm5lbCBidWlsZCBzeXN0ZW0iKQ0KRml4ZXM6IDFmYWU4NjliY2Yz
ZCAoIkRvY3VtZW50YXRpb246IGljZTogUHJlcGFyZSBkb2N1bWVudGF0aW9uIGZvciBSU1QgY29u
dmVyc2lvbiIpDQpGaXhlczogZGY2OWJhNDMyMTdkICgiaW9uaWM6IEFkZCBiYXNpYyBmcmFtZXdv
cmsgZm9yIElPTklDIE5ldHdvcmsgZGV2aWNlIGRyaXZlciIpDQpTaWduZWQtb2ZmLWJ5OiBKb25h
dGhhbiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0Pg0KLS0tDQogLi4uL25ldHdv
cmtpbmcvZGV2aWNlX2RyaXZlcnMvaW50ZWwvZTEwMC5yc3QgICAgICAgfCAxNCArKysrKysrLS0t
LS0tLQ0KIC4uLi9uZXR3b3JraW5nL2RldmljZV9kcml2ZXJzL2ludGVsL2UxMDAwLnJzdCAgICAg
IHwgMTIgKysrKysrLS0tLS0tDQogLi4uL25ldHdvcmtpbmcvZGV2aWNlX2RyaXZlcnMvaW50ZWwv
ZTEwMDBlLnJzdCAgICAgfCAxNCArKysrKysrLS0tLS0tLQ0KIC4uLi9uZXR3b3JraW5nL2Rldmlj
ZV9kcml2ZXJzL2ludGVsL2ZtMTBrLnJzdCAgICAgIHwgMTAgKysrKystLS0tLQ0KIC4uLi9uZXR3
b3JraW5nL2RldmljZV9kcml2ZXJzL2ludGVsL2k0MGUucnN0ICAgICAgIHwgIDggKysrKy0tLS0N
CiAuLi4vbmV0d29ya2luZy9kZXZpY2VfZHJpdmVycy9pbnRlbC9pYXZmLnJzdCAgICAgICB8ICA4
ICsrKystLS0tDQogLi4uL25ldHdvcmtpbmcvZGV2aWNlX2RyaXZlcnMvaW50ZWwvaWNlLnJzdCAg
ICAgICAgfCAgNiArKystLS0NCiAuLi4vbmV0d29ya2luZy9kZXZpY2VfZHJpdmVycy9pbnRlbC9p
Z2IucnN0ICAgICAgICB8IDEyICsrKysrKy0tLS0tLQ0KIC4uLi9uZXR3b3JraW5nL2RldmljZV9k
cml2ZXJzL2ludGVsL2lnYnZmLnJzdCAgICAgIHwgIDYgKysrLS0tDQogLi4uL25ldHdvcmtpbmcv
ZGV2aWNlX2RyaXZlcnMvaW50ZWwvaXhnYmUucnN0ICAgICAgfCAxMCArKysrKy0tLS0tDQogLi4u
L25ldHdvcmtpbmcvZGV2aWNlX2RyaXZlcnMvaW50ZWwvaXhnYmV2Zi5yc3QgICAgfCAgNiArKyst
LS0NCiAuLi4vbmV0d29ya2luZy9kZXZpY2VfZHJpdmVycy9wZW5zYW5kby9pb25pYy5yc3QgICB8
ICA2ICsrKy0tLQ0KIDEyIGZpbGVzIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKyksIDU2IGRlbGV0
aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9uZXR3b3JraW5nL2RldmljZV9k
cml2ZXJzL2ludGVsL2UxMDAucnN0IGIvRG9jdW1lbnRhdGlvbi9uZXR3b3JraW5nL2RldmljZV9k
cml2ZXJzL2ludGVsL2UxMDAucnN0DQppbmRleCAyYjlmNDg4N2JlZGEuLmNhZjAyM2NjODhkZSAx
MDA2NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vbmV0d29ya2luZy9kZXZpY2VfZHJpdmVycy9pbnRl
bC9lMTAwLnJzdA0KKysrIGIvRG9jdW1lbnRhdGlvbi9uZXR3b3JraW5nL2RldmljZV9kcml2ZXJz
L2ludGVsL2UxMDAucnN0DQpAQCAtMSw4ICsxLDggQEANCiAuLiBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMCsNCiANCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PQ0KLUxpbnV4KiBCYXNlIERyaXZlciBmb3IgdGhlIElu
dGVsKFIpIFBSTy8xMDAgRmFtaWx5IG9mIEFkYXB0ZXJzDQotPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCis9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQorTGludXgg
QmFzZSBEcml2ZXIgZm9yIHRoZSBJbnRlbChSKSBQUk8vMTAwIEZhbWlseSBvZiBBZGFwdGVycw0K
Kz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0NCiANCiBKdW5lIDEsIDIwMTgNCiANCkBAIC0yMSw3ICsyMSw3IEBAIENvbnRlbnRzDQog
SW4gVGhpcyBSZWxlYXNlDQogPT09PT09PT09PT09PT09DQogDQotVGhpcyBmaWxlIGRlc2NyaWJl
cyB0aGUgTGludXgqIEJhc2UgRHJpdmVyIGZvciB0aGUgSW50ZWwoUikgUFJPLzEwMCBGYW1pbHkg
b2YNCitUaGlzIGZpbGUgZGVzY3JpYmVzIHRoZSBMaW51eCBCYXNlIERyaXZlciBmb3IgdGhlIElu
dGVsKFIpIFBSTy8xMDAgRmFtaWx5IG9mDQogQWRhcHRlcnMuIFRoaXMgZHJpdmVyIGluY2x1ZGVz
IHN1cHBvcnQgZm9yIEl0YW5pdW0oUikyLWJhc2VkIHN5c3RlbXMuDQogDQogRm9yIHF1ZXN0aW9u
cyByZWxhdGVkIHRvIGhhcmR3YXJlIHJlcXVpcmVtZW50cywgcmVmZXIgdG8gdGhlIGRvY3VtZW50
YXRpb24NCkBAIC0xMzgsOSArMTM4LDkgQEAgdmVyc2lvbiAxLjYgb3IgbGF0ZXIgaXMgcmVxdWly
ZWQgZm9yIHRoaXMgZnVuY3Rpb25hbGl0eS4NCiBUaGUgbGF0ZXN0IHJlbGVhc2Ugb2YgZXRodG9v
bCBjYW4gYmUgZm91bmQgZnJvbQ0KIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL3NvZnR3YXJl
L25ldHdvcmsvZXRodG9vbC8NCiANCi1FbmFibGluZyBXYWtlIG9uIExBTiogKFdvTCkNCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCi1Xb0wgaXMgcHJvdmlkZWQgdGhyb3VnaCB0aGUgZXRo
dG9vbCogdXRpbGl0eS4gIEZvciBpbnN0cnVjdGlvbnMgb24NCitFbmFibGluZyBXYWtlIG9uIExB
TiAoV29MKQ0KKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQorV29MIGlzIHByb3ZpZGVkIHRo
cm91Z2ggdGhlIGV0aHRvb2wgdXRpbGl0eS4gIEZvciBpbnN0cnVjdGlvbnMgb24NCiBlbmFibGlu
ZyBXb0wgd2l0aCBldGh0b29sLCByZWZlciB0byB0aGUgZXRodG9vbCBtYW4gcGFnZS4gIFdvTCB3
aWxsIGJlDQogZW5hYmxlZCBvbiB0aGUgc3lzdGVtIGR1cmluZyB0aGUgbmV4dCBzaHV0IGRvd24g
b3IgcmVib290LiAgRm9yIHRoaXMNCiBkcml2ZXIgdmVyc2lvbiwgaW4gb3JkZXIgdG8gZW5hYmxl
IFdvTCwgdGhlIGUxMDAgZHJpdmVyIG11c3QgYmUgbG9hZGVkDQpkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9uZXR3b3JraW5nL2RldmljZV9kcml2ZXJzL2ludGVsL2UxMDAwLnJzdCBiL0RvY3Vt
ZW50YXRpb24vbmV0d29ya2luZy9kZXZpY2VfZHJpdmVycy9pbnRlbC9lMTAwMC5yc3QNCmluZGV4
IDk1NjU2MGI2ZTc0NS4uNGFhYWUwZjdkNmJhIDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9u
ZXR3b3JraW5nL2RldmljZV9kcml2ZXJzL2ludGVsL2UxMDAwLnJzdA0KKysrIGIvRG9jdW1lbnRh
dGlvbi9uZXR3b3JraW5nL2RldmljZV9kcml2ZXJzL2ludGVsL2UxMDAwLnJzdA0KQEAgLTEsOCAr
MSw4IEBADQogLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjArDQogDQotPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCi1M
aW51eCogQmFzZSBEcml2ZXIgZm9yIEludGVsKFIpIEV0aGVybmV0IE5ldHdvcmsgQ29ubmVjdGlv
bg0KLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09DQorPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQ0KK0xpbnV4IEJhc2UgRHJpdmVyIGZvciBJbnRlbChSKSBFdGhlcm5ldCBOZXR3
b3JrIENvbm5lY3Rpb24NCis9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09DQogDQogSW50ZWwgR2lnYWJpdCBMaW51eCBkcml2ZXIuDQogQ29w
eXJpZ2h0KGMpIDE5OTkgLSAyMDEzIEludGVsIENvcnBvcmF0aW9uLg0KQEAgLTQzOCwxMCArNDM4
LDEwIEBAIGV0aHRvb2wNCiAgIFRoZSBsYXRlc3QgcmVsZWFzZSBvZiBldGh0b29sIGNhbiBiZSBm
b3VuZCBmcm9tDQogICBodHRwczovL3d3dy5rZXJuZWwub3JnL3B1Yi9zb2Z0d2FyZS9uZXR3b3Jr
L2V0aHRvb2wvDQogDQotRW5hYmxpbmcgV2FrZSBvbiBMQU4qIChXb0wpDQotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQorRW5hYmxpbmcgV2FrZSBvbiBMQU4gKFdvTCkNCistLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KIA0KLSAgV29MIGlzIGNvbmZpZ3VyZWQgdGhyb3VnaCB0aGUgZXRo
dG9vbCogdXRpbGl0eS4NCisgIFdvTCBpcyBjb25maWd1cmVkIHRocm91Z2ggdGhlIGV0aHRvb2wg
dXRpbGl0eS4NCiANCiAgIFdvTCB3aWxsIGJlIGVuYWJsZWQgb24gdGhlIHN5c3RlbSBkdXJpbmcg
dGhlIG5leHQgc2h1dCBkb3duIG9yIHJlYm9vdC4NCiAgIEZvciB0aGlzIGRyaXZlciB2ZXJzaW9u
LCBpbiBvcmRlciB0byBlbmFibGUgV29MLCB0aGUgZTEwMDAgZHJpdmVyIG11c3QgYmUNCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL25ldHdvcmtpbmcvZGV2aWNlX2RyaXZlcnMvaW50ZWwvZTEw
MDBlLnJzdCBiL0RvY3VtZW50YXRpb24vbmV0d29ya2luZy9kZXZpY2VfZHJpdmVycy9pbnRlbC9l
MTAwMGUucnN0DQppbmRleCAwMTk5OWYwNTUwOWMuLmY0OWNkMzcwZTdiZiAxMDA2NDQNCi0tLSBh
L0RvY3VtZW50YXRpb24vbmV0d29ya2luZy9kZXZpY2VfZHJpdmVycy9pbnRlbC9lMTAwMGUucnN0
DQorKysgYi9Eb2N1bWVudGF0aW9uL25ldHdvcmtpbmcvZGV2aWNlX2RyaXZlcnMvaW50ZWwvZTEw
MDBlLnJzdA0KQEAgLTEsOCArMSw4IEBADQogLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjArDQogDQotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09DQotTGludXgqIERyaXZlciBmb3IgSW50ZWwoUikgRXRoZXJuZXQgTmV0d29yayBD
b25uZWN0aW9uDQotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09DQorPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0NCitMaW51eCBEcml2ZXIgZm9yIEludGVsKFIpIEV0aGVybmV0IE5ldHdvcmsgQ29u
bmVjdGlvbg0KKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09DQogDQogSW50ZWwgR2lnYWJpdCBMaW51eCBkcml2ZXIuDQogQ29weXJpZ2h0KGMpIDIw
MDgtMjAxOCBJbnRlbCBDb3Jwb3JhdGlvbi4NCkBAIC0zMzgsNyArMzM4LDcgQEAgYW5kIGhpZ2hl
ciBjYW5ub3QgYmUgZm9yY2VkLiBVc2UgdGhlIGF1dG9uZWdvdGlhdGlvbiBhZHZlcnRpc2luZyBz
ZXR0aW5nIHRvDQogbWFudWFsbHkgc2V0IGRldmljZXMgZm9yIDEgR2JwcyBhbmQgaGlnaGVyLg0K
IA0KIFNwZWVkLCBkdXBsZXgsIGFuZCBhdXRvbmVnb3RpYXRpb24gYWR2ZXJ0aXNpbmcgYXJlIGNv
bmZpZ3VyZWQgdGhyb3VnaCB0aGUNCi1ldGh0b29sKiB1dGlsaXR5Lg0KK2V0aHRvb2wgdXRpbGl0
eS4NCiANCiBDYXV0aW9uOiBPbmx5IGV4cGVyaWVuY2VkIG5ldHdvcmsgYWRtaW5pc3RyYXRvcnMg
c2hvdWxkIGZvcmNlIHNwZWVkIGFuZCBkdXBsZXgNCiBvciBjaGFuZ2UgYXV0b25lZ290aWF0aW9u
IGFkdmVydGlzaW5nIG1hbnVhbGx5LiBUaGUgc2V0dGluZ3MgYXQgdGhlIHN3aXRjaCBtdXN0DQpA
QCAtMzUxLDkgKzM1MSw5IEBAIHdpbGwgbm90IGF0dGVtcHQgdG8gYXV0by1uZWdvdGlhdGUgd2l0
aCBpdHMgbGluayBwYXJ0bmVyIHNpbmNlIHRob3NlIGFkYXB0ZXJzDQogb3BlcmF0ZSBvbmx5IGlu
IGZ1bGwgZHVwbGV4IGFuZCBvbmx5IGF0IHRoZWlyIG5hdGl2ZSBzcGVlZC4NCiANCiANCi1FbmFi
bGluZyBXYWtlIG9uIExBTiogKFdvTCkNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCi1X
b0wgaXMgY29uZmlndXJlZCB0aHJvdWdoIHRoZSBldGh0b29sKiB1dGlsaXR5Lg0KK0VuYWJsaW5n
IFdha2Ugb24gTEFOIChXb0wpDQorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCitXb0wgaXMg
Y29uZmlndXJlZCB0aHJvdWdoIHRoZSBldGh0b29sIHV0aWxpdHkuDQogDQogV29MIHdpbGwgYmUg
ZW5hYmxlZCBvbiB0aGUgc3lzdGVtIGR1cmluZyB0aGUgbmV4dCBzaHV0IGRvd24gb3IgcmVib290
LiBGb3INCiB0aGlzIGRyaXZlciB2ZXJzaW9uLCBpbiBvcmRlciB0byBlbmFibGUgV29MLCB0aGUg
ZTEwMDBlIGRyaXZlciBtdXN0IGJlIGxvYWRlZA0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
bmV0d29ya2luZy9kZXZpY2VfZHJpdmVycy9pbnRlbC9mbTEway5yc3QgYi9Eb2N1bWVudGF0aW9u
L25ldHdvcmtpbmcvZGV2aWNlX2RyaXZlcnMvaW50ZWwvZm0xMGsucnN0DQppbmRleCBhYzMyNjll
MzRmNTUuLjRkMjc5ZTY0ZTIyMSAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vbmV0d29ya2lu
Zy9kZXZpY2VfZHJpdmVycy9pbnRlbC9mbTEway5yc3QNCisrKyBiL0RvY3VtZW50YXRpb24vbmV0
d29ya2luZy9kZXZpY2VfZHJpdmVycy9pbnRlbC9mbTEway5yc3QNCkBAIC0xLDggKzEsOCBAQA0K
IC4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKw0KIA0KLT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQotTGludXgq
IEJhc2UgRHJpdmVyIGZvciBJbnRlbChSKSBFdGhlcm5ldCBNdWx0aS1ob3N0IENvbnRyb2xsZXIN
Ci09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQ0KKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0NCitMaW51eCBCYXNlIERyaXZlciBmb3IgSW50ZWwoUikgRXRoZXJuZXQg
TXVsdGktaG9zdCBDb250cm9sbGVyDQorPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KIA0KIEF1Z3VzdCAyMCwgMjAxOA0KIENvcHly
aWdodChjKSAyMDE1LTIwMTggSW50ZWwgQ29ycG9yYXRpb24uDQpAQCAtMTIwLDggKzEyMCw4IEBA
IHJ4LWZsb3ctaGFzaCB0Y3A0fHVkcDR8YWg0fGVzcDR8c2N0cDR8dGNwNnx1ZHA2fGFoNnxlc3A2
fHNjdHA2IG18dnx0fHN8ZHxmfG58cg0KIEtub3duIElzc3Vlcy9Ucm91Ymxlc2hvb3RpbmcNCiA9
PT09PT09PT09PT09PT09PT09PT09PT09PT09DQogDQotRW5hYmxpbmcgU1ItSU9WIGluIGEgNjQt
Yml0IE1pY3Jvc29mdCogV2luZG93cyBTZXJ2ZXIqIDIwMTIvUjIgZ3Vlc3QgT1MgdW5kZXIgTGlu
dXggS1ZNDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQorRW5hYmxpbmcgU1ItSU9W
IGluIGEgNjQtYml0IE1pY3Jvc29mdCBXaW5kb3dzIFNlcnZlciAyMDEyL1IyIGd1ZXN0IE9TIHVu
ZGVyIExpbnV4IEtWTQ0KKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiBLVk0gSHlwZXJ2
aXNvci9WTU0gc3VwcG9ydHMgZGlyZWN0IGFzc2lnbm1lbnQgb2YgYSBQQ0llIGRldmljZSB0byBh
IFZNLiBUaGlzDQogaW5jbHVkZXMgdHJhZGl0aW9uYWwgUENJZSBkZXZpY2VzLCBhcyB3ZWxsIGFz
IFNSLUlPVi1jYXBhYmxlIGRldmljZXMgYmFzZWQgb24NCiB0aGUgSW50ZWwgRXRoZXJuZXQgQ29u
dHJvbGxlciBYTDcxMC4NCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL25ldHdvcmtpbmcvZGV2
aWNlX2RyaXZlcnMvaW50ZWwvaTQwZS5yc3QgYi9Eb2N1bWVudGF0aW9uL25ldHdvcmtpbmcvZGV2
aWNlX2RyaXZlcnMvaW50ZWwvaTQwZS5yc3QNCmluZGV4IDg0OGZkMzg4ZmE2ZS4uOGE5YjE4NTcz
Njg4IDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9uZXR3b3JraW5nL2RldmljZV9kcml2ZXJz
L2ludGVsL2k0MGUucnN0DQorKysgYi9Eb2N1bWVudGF0aW9uL25ldHdvcmtpbmcvZGV2aWNlX2Ry
aXZlcnMvaW50ZWwvaTQwZS5yc3QNCkBAIC0xLDggKzEsOCBAQA0KIC4uIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wKw0KIA0KLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KLUxpbnV4KiBCYXNlIERyaXZlciBm
b3IgdGhlIEludGVsKFIpIEV0aGVybmV0IENvbnRyb2xsZXIgNzAwIFNlcmllcw0KLT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQ0KKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09DQorTGludXggQmFzZSBEcml2ZXIgZm9yIHRoZSBJbnRlbChSKSBFdGhlcm5l
dCBDb250cm9sbGVyIDcwMCBTZXJpZXMNCis9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KIA0KIEludGVsIDQwIEdpZ2FiaXQg
TGludXggZHJpdmVyLg0KIENvcHlyaWdodChjKSAxOTk5LTIwMTggSW50ZWwgQ29ycG9yYXRpb24u
DQpAQCAtMzg0LDcgKzM4NCw3IEBAIE5PVEU6IFlvdSBjYW5ub3Qgc2V0IHRoZSBzcGVlZCBmb3Ig
ZGV2aWNlcyBiYXNlZCBvbiB0aGUgSW50ZWwoUikgRXRoZXJuZXQNCiBOZXR3b3JrIEFkYXB0ZXIg
WFhWNzEwIGJhc2VkIGRldmljZXMuDQogDQogU3BlZWQsIGR1cGxleCwgYW5kIGF1dG9uZWdvdGlh
dGlvbiBhZHZlcnRpc2luZyBhcmUgY29uZmlndXJlZCB0aHJvdWdoIHRoZQ0KLWV0aHRvb2wqIHV0
aWxpdHkuDQorZXRodG9vbCB1dGlsaXR5Lg0KIA0KIENhdXRpb246IE9ubHkgZXhwZXJpZW5jZWQg
bmV0d29yayBhZG1pbmlzdHJhdG9ycyBzaG91bGQgZm9yY2Ugc3BlZWQgYW5kIGR1cGxleA0KIG9y
IGNoYW5nZSBhdXRvbmVnb3RpYXRpb24gYWR2ZXJ0aXNpbmcgbWFudWFsbHkuIFRoZSBzZXR0aW5n
cyBhdCB0aGUgc3dpdGNoIG11c3QNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL25ldHdvcmtp
bmcvZGV2aWNlX2RyaXZlcnMvaW50ZWwvaWF2Zi5yc3QgYi9Eb2N1bWVudGF0aW9uL25ldHdvcmtp
bmcvZGV2aWNlX2RyaXZlcnMvaW50ZWwvaWF2Zi5yc3QNCmluZGV4IGNmYzA4ODQyZTMyYy4uODRh
YzdlNzVmMzYzIDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9uZXR3b3JraW5nL2RldmljZV9k
cml2ZXJzL2ludGVsL2lhdmYucnN0DQorKysgYi9Eb2N1bWVudGF0aW9uL25ldHdvcmtpbmcvZGV2
aWNlX2RyaXZlcnMvaW50ZWwvaWF2Zi5yc3QNCkBAIC0xLDggKzEsOCBAQA0KIC4uIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKw0KIA0KLT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KLUxpbnV4KiBCYXNlIERy
aXZlciBmb3IgSW50ZWwoUikgRXRoZXJuZXQgQWRhcHRpdmUgVmlydHVhbCBGdW5jdGlvbg0KLT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQ0KKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09DQorTGludXggQmFzZSBEcml2ZXIgZm9yIEludGVsKFIpIEV0aGVy
bmV0IEFkYXB0aXZlIFZpcnR1YWwgRnVuY3Rpb24NCis9PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KIA0KIEludGVsIEV0aGVy
bmV0IEFkYXB0aXZlIFZpcnR1YWwgRnVuY3Rpb24gTGludXggZHJpdmVyLg0KIENvcHlyaWdodChj
KSAyMDEzLTIwMTggSW50ZWwgQ29ycG9yYXRpb24uDQpAQCAtMTksNyArMTksNyBAQCBDb250ZW50
cw0KIE92ZXJ2aWV3DQogPT09PT09PT0NCiANCi1UaGlzIGZpbGUgZGVzY3JpYmVzIHRoZSBpYXZm
IExpbnV4KiBCYXNlIERyaXZlci4gVGhpcyBkcml2ZXIgd2FzIGZvcm1lcmx5DQorVGhpcyBmaWxl
IGRlc2NyaWJlcyB0aGUgaWF2ZiBMaW51eCBCYXNlIERyaXZlci4gVGhpcyBkcml2ZXIgd2FzIGZv
cm1lcmx5DQogY2FsbGVkIGk0MGV2Zi4NCiANCiBUaGUgaWF2ZiBkcml2ZXIgc3VwcG9ydHMgdGhl
IGJlbG93IG1lbnRpb25lZCB2aXJ0dWFsIGZ1bmN0aW9uIGRldmljZXMgYW5kDQpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9uZXR3b3JraW5nL2RldmljZV9kcml2ZXJzL2ludGVsL2ljZS5yc3Qg
Yi9Eb2N1bWVudGF0aW9uL25ldHdvcmtpbmcvZGV2aWNlX2RyaXZlcnMvaW50ZWwvaWNlLnJzdA0K
aW5kZXggYzIyMGFhMjcxMWM2Li5lZTQzZWE1N2Q0NDMgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0
aW9uL25ldHdvcmtpbmcvZGV2aWNlX2RyaXZlcnMvaW50ZWwvaWNlLnJzdA0KKysrIGIvRG9jdW1l
bnRhdGlvbi9uZXR3b3JraW5nL2RldmljZV9kcml2ZXJzL2ludGVsL2ljZS5yc3QNCkBAIC0xLDgg
KzEsOCBAQA0KIC4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKw0KIA0KLT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0NCi1MaW51eCogQmFzZSBEcml2ZXIgZm9yIHRoZSBJbnRlbChSKSBFdGhlcm5ldCBDb25u
ZWN0aW9uIEU4MDAgU2VyaWVzDQotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KKz09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KK0xpbnV4IEJhc2Ug
RHJpdmVyIGZvciB0aGUgSW50ZWwoUikgRXRoZXJuZXQgQ29ubmVjdGlvbiBFODAwIFNlcmllcw0K
Kz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQ0KIA0KIEludGVsIGljZSBMaW51eCBkcml2ZXIuDQogQ29weXJpZ2h0KGMpIDIw
MTggSW50ZWwgQ29ycG9yYXRpb24uDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9uZXR3b3Jr
aW5nL2RldmljZV9kcml2ZXJzL2ludGVsL2lnYi5yc3QgYi9Eb2N1bWVudGF0aW9uL25ldHdvcmtp
bmcvZGV2aWNlX2RyaXZlcnMvaW50ZWwvaWdiLnJzdA0KaW5kZXggZmM4Y2ZhYTVkY2ZhLi44N2U1
NjBmZTVlYWEgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL25ldHdvcmtpbmcvZGV2aWNlX2Ry
aXZlcnMvaW50ZWwvaWdiLnJzdA0KKysrIGIvRG9jdW1lbnRhdGlvbi9uZXR3b3JraW5nL2Rldmlj
ZV9kcml2ZXJzL2ludGVsL2lnYi5yc3QNCkBAIC0xLDggKzEsOCBAQA0KIC4uIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wKw0KIA0KLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQotTGludXgqIEJhc2UgRHJpdmVyIGZvciBJ
bnRlbChSKSBFdGhlcm5ldCBOZXR3b3JrIENvbm5lY3Rpb24NCi09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KKz09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCitMaW51eCBCYXNl
IERyaXZlciBmb3IgSW50ZWwoUikgRXRoZXJuZXQgTmV0d29yayBDb25uZWN0aW9uDQorPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KIA0K
IEludGVsIEdpZ2FiaXQgTGludXggZHJpdmVyLg0KIENvcHlyaWdodChjKSAxOTk5LTIwMTggSW50
ZWwgQ29ycG9yYXRpb24uDQpAQCAtMTI5LDkgKzEyOSw5IEBAIHZlcnNpb24gaXMgcmVxdWlyZWQg
Zm9yIHRoaXMgZnVuY3Rpb25hbGl0eS4gRG93bmxvYWQgaXQgYXQ6DQogaHR0cHM6Ly93d3cua2Vy
bmVsLm9yZy9wdWIvc29mdHdhcmUvbmV0d29yay9ldGh0b29sLw0KIA0KIA0KLUVuYWJsaW5nIFdh
a2Ugb24gTEFOKiAoV29MKQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KLVdvTCBpcyBj
b25maWd1cmVkIHRocm91Z2ggdGhlIGV0aHRvb2wqIHV0aWxpdHkuDQorRW5hYmxpbmcgV2FrZSBv
biBMQU4gKFdvTCkNCistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KK1dvTCBpcyBjb25maWd1
cmVkIHRocm91Z2ggdGhlIGV0aHRvb2wgdXRpbGl0eS4NCiANCiBXb0wgd2lsbCBiZSBlbmFibGVk
IG9uIHRoZSBzeXN0ZW0gZHVyaW5nIHRoZSBuZXh0IHNodXQgZG93biBvciByZWJvb3QuIEZvcg0K
IHRoaXMgZHJpdmVyIHZlcnNpb24sIGluIG9yZGVyIHRvIGVuYWJsZSBXb0wsIHRoZSBpZ2IgZHJp
dmVyIG11c3QgYmUgbG9hZGVkDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9uZXR3b3JraW5n
L2RldmljZV9kcml2ZXJzL2ludGVsL2lnYnZmLnJzdCBiL0RvY3VtZW50YXRpb24vbmV0d29ya2lu
Zy9kZXZpY2VfZHJpdmVycy9pbnRlbC9pZ2J2Zi5yc3QNCmluZGV4IDljZGRhYmU4MTA4ZS4uNTU3
ZmMwMjBlZjMxIDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9uZXR3b3JraW5nL2RldmljZV9k
cml2ZXJzL2ludGVsL2lnYnZmLnJzdA0KKysrIGIvRG9jdW1lbnRhdGlvbi9uZXR3b3JraW5nL2Rl
dmljZV9kcml2ZXJzL2ludGVsL2lnYnZmLnJzdA0KQEAgLTEsOCArMSw4IEBADQogLi4gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjArDQogDQotPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQotTGludXgqIEJhc2UgVmlydHVh
bCBGdW5jdGlvbiBEcml2ZXIgZm9yIEludGVsKFIpIDFHIEV0aGVybmV0DQotPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQorPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCitM
aW51eCBCYXNlIFZpcnR1YWwgRnVuY3Rpb24gRHJpdmVyIGZvciBJbnRlbChSKSAxRyBFdGhlcm5l
dA0KKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09DQogDQogSW50ZWwgR2lnYWJpdCBWaXJ0dWFsIEZ1bmN0aW9uIExpbnV4IGRyaXZlci4N
CiBDb3B5cmlnaHQoYykgMTk5OS0yMDE4IEludGVsIENvcnBvcmF0aW9uLg0KZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vbmV0d29ya2luZy9kZXZpY2VfZHJpdmVycy9pbnRlbC9peGdiZS5yc3Qg
Yi9Eb2N1bWVudGF0aW9uL25ldHdvcmtpbmcvZGV2aWNlX2RyaXZlcnMvaW50ZWwvaXhnYmUucnN0
DQppbmRleCBjN2QyNTQ4M2ZlZGIuLmYxZDUyMzNlNWU1MSAxMDA2NDQNCi0tLSBhL0RvY3VtZW50
YXRpb24vbmV0d29ya2luZy9kZXZpY2VfZHJpdmVycy9pbnRlbC9peGdiZS5yc3QNCisrKyBiL0Rv
Y3VtZW50YXRpb24vbmV0d29ya2luZy9kZXZpY2VfZHJpdmVycy9pbnRlbC9peGdiZS5yc3QNCkBA
IC0xLDggKzEsOCBAQA0KIC4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKw0KIA0K
LT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09DQotTGludXgqIEJhc2UgRHJpdmVyIGZvciB0aGUgSW50ZWwo
UikgRXRoZXJuZXQgMTAgR2lnYWJpdCBQQ0kgRXhwcmVzcyBBZGFwdGVycw0KLT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09DQorPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQorTGludXggQmFzZSBEcml2ZXIgZm9yIHRo
ZSBJbnRlbChSKSBFdGhlcm5ldCAxMCBHaWdhYml0IFBDSSBFeHByZXNzIEFkYXB0ZXJzDQorPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09DQogDQogSW50ZWwgMTAgR2lnYWJpdCBMaW51eCBkcml2ZXIuDQogQ29w
eXJpZ2h0KGMpIDE5OTktMjAxOCBJbnRlbCBDb3Jwb3JhdGlvbi4NCkBAIC01MTksOCArNTE5LDgg
QEAgVGhlIG9mZmxvYWQgaXMgYWxzbyBzdXBwb3J0ZWQgZm9yIGl4Z2JlJ3MgVkZzLCBidXQgdGhl
IFZGIG11c3QgYmUgc2V0IGFzDQogS25vd24gSXNzdWVzL1Ryb3VibGVzaG9vdGluZw0KID09PT09
PT09PT09PT09PT09PT09PT09PT09PT0NCiANCi1FbmFibGluZyBTUi1JT1YgaW4gYSA2NC1iaXQg
TWljcm9zb2Z0KiBXaW5kb3dzIFNlcnZlciogMjAxMi9SMiBndWVzdCBPUw0KLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tDQorRW5hYmxpbmcgU1ItSU9WIGluIGEgNjQtYml0IE1pY3Jvc29mdCBXaW5kb3dzIFNlcnZl
ciAyMDEyL1IyIGd1ZXN0IE9TDQorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQogTGludXggS1ZNIEh5cGVydmlzb3Iv
Vk1NIHN1cHBvcnRzIGRpcmVjdCBhc3NpZ25tZW50IG9mIGEgUENJZSBkZXZpY2UgdG8gYSBWTS4N
CiBUaGlzIGluY2x1ZGVzIHRyYWRpdGlvbmFsIFBDSWUgZGV2aWNlcywgYXMgd2VsbCBhcyBTUi1J
T1YtY2FwYWJsZSBkZXZpY2VzIGJhc2VkDQogb24gdGhlIEludGVsIEV0aGVybmV0IENvbnRyb2xs
ZXIgWEw3MTAuDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9uZXR3b3JraW5nL2RldmljZV9k
cml2ZXJzL2ludGVsL2l4Z2JldmYucnN0IGIvRG9jdW1lbnRhdGlvbi9uZXR3b3JraW5nL2Rldmlj
ZV9kcml2ZXJzL2ludGVsL2l4Z2JldmYucnN0DQppbmRleCA1ZDQ5NzczNjAxNTcuLjc2YmJkZTcz
NmYyMSAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vbmV0d29ya2luZy9kZXZpY2VfZHJpdmVy
cy9pbnRlbC9peGdiZXZmLnJzdA0KKysrIGIvRG9jdW1lbnRhdGlvbi9uZXR3b3JraW5nL2Rldmlj
ZV9kcml2ZXJzL2ludGVsL2l4Z2JldmYucnN0DQpAQCAtMSw4ICsxLDggQEANCiAuLiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsNCiANCi09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQotTGludXgqIEJhc2UgVmlydHVh
bCBGdW5jdGlvbiBEcml2ZXIgZm9yIEludGVsKFIpIDEwRyBFdGhlcm5ldA0KLT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCis9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0N
CitMaW51eCBCYXNlIFZpcnR1YWwgRnVuY3Rpb24gRHJpdmVyIGZvciBJbnRlbChSKSAxMEcgRXRo
ZXJuZXQNCis9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0NCiANCiBJbnRlbCAxMCBHaWdhYml0IFZpcnR1YWwgRnVuY3Rpb24gTGludXgg
ZHJpdmVyLg0KIENvcHlyaWdodChjKSAxOTk5LTIwMTggSW50ZWwgQ29ycG9yYXRpb24uDQpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9uZXR3b3JraW5nL2RldmljZV9kcml2ZXJzL3BlbnNhbmRv
L2lvbmljLnJzdCBiL0RvY3VtZW50YXRpb24vbmV0d29ya2luZy9kZXZpY2VfZHJpdmVycy9wZW5z
YW5kby9pb25pYy5yc3QNCmluZGV4IDY3YjY4MzlkNTE2Yi4uM2FmZTk3NTE0ZDY4IDEwMDY0NA0K
LS0tIGEvRG9jdW1lbnRhdGlvbi9uZXR3b3JraW5nL2RldmljZV9kcml2ZXJzL3BlbnNhbmRvL2lv
bmljLnJzdA0KKysrIGIvRG9jdW1lbnRhdGlvbi9uZXR3b3JraW5nL2RldmljZV9kcml2ZXJzL3Bl
bnNhbmRvL2lvbmljLnJzdA0KQEAgLTEsOCArMSw4IEBADQogLi4gU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjArDQogDQotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQ0KLUxpbnV4KiBEcml2ZXIgZm9yIHRoZSBQZW5zYW5kbyhS
KSBFdGhlcm5ldCBhZGFwdGVyIGZhbWlseQ0KLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCis9PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KK0xpbnV4IERyaXZlciBmb3IgdGhlIFBl
bnNhbmRvKFIpIEV0aGVybmV0IGFkYXB0ZXIgZmFtaWx5DQorPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCiANCiBQZW5zYW5kbyBMaW51eCBF
dGhlcm5ldCBkcml2ZXIuDQogQ29weXJpZ2h0KGMpIDIwMTkgUGVuc2FuZG8gU3lzdGVtcywgSW5j
DQotLSANCjIuMjAuMQ0KDQo=


--MP_/gdOMqLR7kgg3VNU=OkOZWXz--
