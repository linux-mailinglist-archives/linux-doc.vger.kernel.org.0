Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B01D0115961
	for <lists+linux-doc@lfdr.de>; Fri,  6 Dec 2019 23:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbfLFWiy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 6 Dec 2019 17:38:54 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46903 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbfLFWix (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Dec 2019 17:38:53 -0500
Received: by mail-lj1-f195.google.com with SMTP id z17so9255021ljk.13;
        Fri, 06 Dec 2019 14:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=P85T3De0XgZWgwaNG8UoR5wkfmgsYuEdcbSUGvS2TJo=;
        b=NbN91S9DKErY46f0X6oYtQB6BizOA0pBO5ElsYqjTwaQ6q3Hey7ts3VyBJs8RhMFGW
         FzExE6G+hujpJGaHBmHnCStdWpbDCqoY6SZpQDYwhW92bfplkytUOwURENVETl2/AlFd
         Pe8LFa0BeVHnLpVEF1KmtalnD5qkXupNPo1aPF905nlxcBO+OtEbb+bqnH6Ah/6UxXFb
         IbH3+987l9e2m+6tG6yZ0W7zLBiJQJrDQD4u09aMHe4g+p7cukNYo88TlKG0FmkOgopD
         G6VvnhrlNWMvs0ZQypUsdNXAwh7ERowbBnDZ57u5agvrQ9pDR1v+iSBB/OsQlK1jbglY
         AzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=P85T3De0XgZWgwaNG8UoR5wkfmgsYuEdcbSUGvS2TJo=;
        b=DN/TpEN/fBsm6IskKQmgaw3/aDr+9k+auze7w8pTZ0csBoEqDZxVK0NHeUgiXmtMBF
         92O05QCCdTeUKbxkTP5rwneObOAguNpRb8pZxCTJOF8A6eArYXjy602rA9Lph6TAseok
         /r1AQsxH6zX5A4oWSmzKpdiBfll5/MwkDvA2GpqT1QC2cCKcudj3lfPa+uh9mlX5/lRw
         ATRuVO62li1LdAtG4osxAh8hiQzTQbtFHcvr9LKJeem8qKoIhIBs8Fd+6/2jTo/Bn64q
         JwtOyfD02sEvC3POEb3yZ1ZAPMbdD+sZz6BdX7Fn5SZgnvlbCzJLol+5iwMocgMhV9Xi
         hoUQ==
X-Gm-Message-State: APjAAAWE/Ipi48lNLpBf3Ltfw252bQrg7k8GvasN8gClhMLFXxNKZBpG
        tENzq1InLtiw+yeQvQzd3uPIK2k5N83vpuWe6Gw=
X-Google-Smtp-Source: APXvYqwJWEf2pRvIKFBzIW/HW1wSFEz0TaGqyjkaqBRU6JIpboXhO0pxsCfvhqH2Jrz+rcNmye+mDFwfD9FqhQ/fP0Y=
X-Received: by 2002:a2e:8953:: with SMTP id b19mr9057604ljk.249.1575671930089;
 Fri, 06 Dec 2019 14:38:50 -0800 (PST)
MIME-Version: 1.0
References: <20191121193209.15687-1-sj38.park@gmail.com> <20191129180837.7233-1-sjpark@amazon.de>
 <CAEjAshpsnrfkb83738rtkPbQohoFP0LZbP_45rUqyBX-RvsVwg@mail.gmail.com>
 <20191206204406.GK2889@paulmck-ThinkPad-P72> <CAEjAshrGRafO4-k0tDD_XjC8EDq11AOh3PX+bPUhrjkuo+N76A@mail.gmail.com>
 <20191206220858.GL2889@paulmck-ThinkPad-P72>
In-Reply-To: <20191206220858.GL2889@paulmck-ThinkPad-P72>
From:   SeongJae Park <sj38.park@gmail.com>
Date:   Fri, 6 Dec 2019 23:38:22 +0100
Message-ID: <CAEjAshosihoc7YR4WrseZDe_oquiJPeP+2yyCDRJuMJ4rzsp8w@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation/barriers/kokr: Remove references to [smp_]read_barrier_depends()
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>, notify@kernel.org,
        SeongJae Park <sjpark@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gRnJpLCBEZWMgNiwgMjAxOSBhdCAxMTowOCBQTSBQYXVsIEUuIE1jS2VubmV5IDxwYXVsbWNr
QGtlcm5lbC5vcmc+IHdyb3RlOg0KPg0KPiBPbiBGcmksIERlYyAwNiwgMjAxOSBhdCAxMDoyOTo1
MFBNICswMTAwLCBTZW9uZ0phZSBQYXJrIHdyb3RlOg0KPiA+IE9uIEZyaSwgRGVjIDYsIDIwMTkg
YXQgOTo0NCBQTSBQYXVsIEUuIE1jS2VubmV5IDxwYXVsbWNrQGtlcm5lbC5vcmc+IHdyb3RlOg0K
PiA+ID4NCj4gPiA+IE9uIEZyaSwgRGVjIDA2LCAyMDE5IGF0IDA2OjIwOjUxUE0gKzAxMDAsIFNl
b25nSmFlIFBhcmsgd3JvdGU6DQo+ID4gPiA+IEhlbGxvIFBhdWwgYW5kIFdpbGwsDQo+ID4gPiA+
DQo+ID4gPiA+IE9uIEZyaSwgTm92IDI5LCAyMDE5IGF0IDc6MDkgUE0gU2VvbmdKYWUgUGFyayA8
c2ozOC5wYXJrQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBQYXVsLCB0
aGFuayB5b3UgZm9yIHdhaXRpbmcgbG9uZy4gIEkgZ290IHJldmlld2VkIGJ5IGFub3RoZXIgS29y
ZWFuDQo+ID4gPiA+ID4gaGFja2VyLCBZdW5qYWUuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBDaGFu
Z2VzIGZyb20gdjEgKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxOTExMjExOTMyMDku
MTU2ODctMS1zajM4LnBhcmtAZ21haWwuY29tLykNCj4gPiA+ID4gPiAtIEdldCBhIHJldmlldyBm
cm9tIFl1bmphZQ0KPiA+ID4gPiA+IC0gTWlub3Igd29yZHNtaXRoIGJhc2VkIG9uIHRoZSByZXZp
ZXcgY29tbWVudA0KPiA+ID4gPiA+IC0gUmViYXNlZCBvbiBnaXQ6Ly9naXQubHduLm5ldC9saW51
eC5naXQgdGFncy9kb2NzLTUuNQ0KPiA+ID4gPiA+IC0gVXBkYXRlIGF1dGhvcidzIGVtYWlsIGFk
ZHJlc3MNCj4gPiA+ID4NCj4gPiA+ID4gTWF5IEkgYXNrIHlvdXIgY29tbWVudHM/DQo+ID4gPg0K
PiA+ID4gSSB0aG91Z2h0IHRoYXQgSm9uIENvcmJldCBoYWQgYWxyZWFkeSBxdWV1ZWQgdGhlc2Uu
ICBEaWQgSSBtaXNzIHNvbWU/DQo+ID4NCj4gPiBUaGlzIHBhdGNoIGhhcyBub3QgcXVldWVkIGJ5
IEpvbiwgaW5kZWVkLiAgSSBoYXZlbid0IENDLWVkIG5laXRoZXIgSm9uLCBub3INCj4gPiBsaW51
eC1kb2MgZm9yIHRoZSAxc3QgdmVyc2lvbiBvZiB0aGlzIHBhdGNoIGJlY2F1c2UgdGhpcyBpcyBh
IGZvbGxvd3VwIG9mDQo+ID4gV2lsbCdzIHBhdGNoWzFdIGFuZCB0aGUgV2lsbCdzIHBhdGNoIGFs
c28gaGF2ZSBub3QgQ0MtZWQgdGhlbS4NCj4gPg0KPiA+IEkgc2VudCBhbm90aGVyIHBhdGNoc2V0
WzJdIGZvciBkb2N1bWVudHMgc2ltdWx0YW5lb3VzbHkgYnV0IENDLWVkIEpvbiBhbmQNCj4gPiBs
aW51eC1kb2MgZm9yIHRoZSBwYXRjaCwgYmVjYXVzZSB0aGUgcGF0Y2hzZXQgaXMgYSBmb2xsb3d1
cCBvZiB0aGUgY29tbWl0cw0KPiA+IHdoaWNoIGFscmVhZHkgbWVyZ2VkIGluIFRvcnZhbGRzJ3Mg
dHJlZS4gIFRoZSBwYXRjaHNldCBoYXMgcXVldWVkIGJ5IGJvdGggb2YNCj4gPiB5b3UgYW5kIHRo
ZW4geW91IGFncmVlZCB0byBtZXJnZSBpdCBieSBKb24ncyB0cmVlLiAgSSBndWVzcyBJIG1hZGUg
dGhlDQo+ID4gY29uZnVzaW9uIGluIHRoaXMgd2F5LiAgU29ycnkgZm9yIG1ha2luZyBzdWNoIGNv
bmZ1c2lvbi4gIEFueXdheSwgdGhpcyBwYXRjaA0KPiA+IGlzIG5vdCBxdWV1ZWQgaW4gYW55IHRy
ZWUsIEFGSUsuDQo+DQo+IE5vdCBhIHByb2JsZW0gYXQgYWxsIQ0KDQpUaGF0J3MgYSByZWxpZWYh
DQoNCj4NCj4gQnV0IHNpbmNlIEpvbiBzZWVtcyB0byBiZSB0YWtpbmcgdGhlc2UgaW4gaGlzIGNh
cGFjaXR5IGFuZCBEb2N1bWVudGF0aW9uDQo+IG1haW50YWluZXIsIGNvdWxkIHlvdSBwbGVhc2Ug
cmVzZW5kIENDaW5nIGhpbT8gIElmIHdlIGhhdmUgdGhlc2UgY2hhbmdlcw0KPiBzY2F0dGVyZWQg
YWNyb3NzIHRvbyBtYW55IHRyZWVzLCBzb21lb25lIGlzIGdvaW5nIHRvIGdldCBjb25mdXNlZCwN
Cj4gYW5kIGl0IHByb2JhYmx5IHdpbGwgYmUgbWUuICA7LSkNCg0KQWdyZWVkLCBDQy1pbmcgSm9u
IHRvIHRoaXMgbWFpbC4gIFRoYXQgc2FpZCwgdGhpcyBpcyBhIGZvbGxvd3VwIG9mIFdpbGwncw0K
cGF0Y2hbMV0gYW5kIHRoZSBwYXRjaCBpcyBhbHNvIG5vdCBxdWV1ZWQgaW4gSm9uJ3MgdHJlZS4g
IFNvLCBJIHdvdWxkIGxpa2UgdG8NCmhlYXIgV2lsbCdzIG9waW5pb24gZWl0aGVyLCBpZiBwb3Nz
aWJsZS4NCg0KWzFdICBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkxMTA4MTcwMTIw
LjIyMzMxLTEwLXdpbGxAa2VybmVsLm9yZy8NCg0KDQpUaGFua3MsDQpTZW9uZ0phZSBQYXJrDQoN
Cj4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBUaGFueCwgUGF1bA0KPg0KPiA+IFRoYW5rcywNCj4gPiBTZW9uZ0phZSBQYXJrDQo+ID4N
Cj4gPg0KPiA+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkxMTA4MTcwMTIw
LjIyMzMxLTEwLXdpbGxAa2VybmVsLm9yZy8NCj4gPiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtZG9jLzIwMTkxMTIxMjM0MTI1LjI4MDMyLTEtc2ozOC5wYXJrQGdtYWlsLmNvbS8N
Cj4gPg0KPiA+ID4NCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgVGhhbngsIFBhdWwNCj4gPiA+DQo+ID4gPiA+IFRoYW5rcywNCj4g
PiA+ID4gU2VvbmdKYWUgUGFyaw0KPiA+ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tID44IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGlzIGNvbW1pdCB0cmFuc2xh
dGVzIGNvbW1pdCA4MDg4NjE2ZDRjYTYgKCJEb2N1bWVudGF0aW9uL2JhcnJpZXJzOg0KPiA+ID4g
PiA+IFJlbW92ZSByZWZlcmVuY2VzIHRvIFtzbXBfXXJlYWRfYmFycmllcl9kZXBlbmRzKCkiKSBv
ZiBXaWxsJ3MgdHJlZVsxXQ0KPiA+ID4gPiA+IGludG8gS29yZWFuLg0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4gWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3dpbGwvbGludXguZ2l0L2NvbW1pdC9Eb2N1bWVudGF0aW9uL21lbW9yeS1iYXJyaWVycy50eHQ/
aD1sdG8maWQ9ODA4ODYxNmQ0Y2E2MWNkNmI3NzAyMjVmMzBmZWM2NmM2ZjY3NjdmYg0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpv
bi5kZT4NCj4gPiA+ID4gPiBSZXZpZXdlZC1ieTogWXVuamFlIExlZSA8bHlqNzY5NEBnbWFpbC5j
b20+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiAgLi4uL3RyYW5zbGF0aW9u
cy9rb19LUi9tZW1vcnktYmFycmllcnMudHh0ICAgIHwgMTQ2ICstLS0tLS0tLS0tLS0tLS0tLQ0K
PiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxNDMgZGVsZXRpb25z
KC0pDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFu
c2xhdGlvbnMva29fS1IvbWVtb3J5LWJhcnJpZXJzLnR4dCBiL0RvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL2tvX0tSL21lbW9yeS1iYXJyaWVycy50eHQNCj4gPiA+ID4gPiBpbmRleCBmMDdjNDBh
MDY4YjUuLmE4ZDI2ZGY5MzYwYiAxMDA2NDQNCj4gPiA+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy9rb19LUi9tZW1vcnktYmFycmllcnMudHh0DQo+ID4gPiA+ID4gKysrIGIv
RG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMva29fS1IvbWVtb3J5LWJhcnJpZXJzLnR4dA0KPiA+
ID4gPiA+IEBAIC01NzcsNyArNTc3LDcgQEAgQUNRVUlSRSDripQg7ZW064u5IOyYpO2NvOugiOyd
tOyFmOydmCDroZzrk5wg67aA67aE7JeQ66eMIOyggeyaqeuQmOqzoCBSRUxFQVNFDQo+ID4gPiA+
ID4gIOuNsOydtO2EsCDsnZjsobTshLEg67Cw66as7Ja0ICjsl63sgqzsoIEpDQo+ID4gPiA+ID4g
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAt66as
64iF7IqkIOy7pOuEkCB2NC4xNSDquLDspIDsnLzroZwsIHNtcF9yZWFkX2JhcnJpZXJfZGVwZW5k
cygpIOqwgCBSRUFEX09OQ0UoKSDsl5ANCj4gPiA+ID4gPiAr66as64iF7IqkIOy7pOuEkCB2NC4x
NSDquLDspIDsnLzroZwsIHNtcF9tYigpIOqwgCBERUMgQWxwaGEg7JqpIFJFQURfT05DRSgpIOy9
lOuTnOyXkA0KPiA+ID4gPiA+ICDstpTqsIDrkJjsl4jripTrjbAsIOydtOuKlCDsnbQg7IS57IWY
7JeQIOyjvOydmOulvCDquLDsmrjsl6zslbwg7ZWY64qUIOyCrOuejOuTpOydgCBERUMgQWxwaGEg
7JWE7YKk7YWN7LOQDQo+ID4gPiA+ID4gIOyghOyaqSDsvZTrk5zrpbwg66eM65Oc64qUIOyCrOue
jOuTpOqzvCBSRUFEX09OQ0UoKSDsnpDssrTrpbwg66eM65Oc64qUIOyCrOuejOuTpCDrv5DsnoTs
nYQg7J2Y66+47ZWp64uI64ukLg0KPiA+ID4gPiA+ICDqt7jrn7Ag67aE65Ok7J2EIOychO2VtCwg
6re466as6rOgIOyXreyCrOyXkCDqtIDsi6wg7J6I64qUIOu2hOuTpOydhCDsnITtlbQsIOyXrOq4
sCDrjbDsnbTthLAg7J2Y7KG07ISxDQo+ID4gPiA+ID4gQEAgLTI2NjEsMTQ0ICsyNjYxLDYgQEAg
Q1BVIOy9lOyWtOuKlCDtlITroZzqt7jrnqjsnZgg7J246rO87ISx7J20IOycoOyngOuQnOuLpOqz
oOunjCDsl6zqsqjsp4Tri6TrqbQNCj4gPiA+ID4gPiAg7IiY64+EIOyeiOyKteuLiOuLpC4NCj4g
PiA+ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gLey6kOyLnCDsnbzqtIDshLENCj4gPiA+ID4g
PiAtLS0tLS0tLS0tLS0NCj4gPiA+ID4gPiAtDQo+ID4gPiA+ID4gLe2VmOyngOunjCDsgrbsnYAg
7JWe7JeQ7IScIOydtOyVvOq4sO2VnCDqsoPsspjrn7wg64uo7Iic7ZWY7KeAIOyViuyKteuLiOuL
pDog7LqQ7Iuc65Ok7J2AIOydvOq0gOyggeydvCDqsoPsnLzroZwNCj4gPiA+ID4gPiAt6riw64yA
65CY7KeA66eMLCDqt7gg7J286rSA7ISx7J20IOyInOyEnOyXkOuPhCDsoIHsmqnrkKAg6rGw6528
64qUIOuztOyepeydgCDsl4bsirXri4jri6QuICDtlZwgQ1BVIOyXkOyEnA0KPiA+ID4gPiA+IC3r
p4zrk6TslrTsp4Qg67OA6rK9IOyCrO2VreydgCDstZzsooXsoIHsnLzroZzripQg7Iuc7Iqk7YWc
7J2YIOuqqOuToCBDUFUg7JeQ6rKMIOuztOyXrOyngOqyjCDrkJjsp4Drp4wsIOuLpOuluA0KPiA+
ID4gPiA+IC1DUFUg65Ok7JeQ6rKM64+EIOqwmeydgCDsiJzshJzroZwg67O07J206rKMIOuQoCDq
sbDrnbzripQg67O07J6l7J2AIOyXhuuLpOuKlCDrnLvsnoXri4jri6QuDQo+ID4gPiA+ID4gLQ0K
PiA+ID4gPiA+IC0NCj4gPiA+ID4gPiAt65GQ6rCc7J2YIENQVSAoMSAmIDIpIOqwgCDri6zroKQg
7J6I6rOgLCDqsIEgQ1BVIOyXkCDrkZDqsJzsnZgg642w7J207YSwIOy6kOyLnChDUFUgMSDsnYAg
QS9CIOulvCwNCj4gPiA+ID4gPiAtQ1BVIDIg64qUIEMvRCDrpbwg6rCW7Iq164uI64ukKeqwgCDr
s5HroKzroZwg7Jew6rKw65CY7Ja0IOyeiOuKlCDsi5zsiqTthZzsnYQg64uk66Os64uk6rOgIOyD
neqwge2VtA0KPiA+ID4gPiA+IC3rtIXsi5zri6Q6DQo+ID4gPiA+ID4gLQ0KPiA+ID4gPiA+IC0g
ICAgICAgICAgICAgICAgICAgOg0KPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgOiAgICAg
ICAgICAgICAgICAgICAgICAgICAgKy0tLS0tLS0tKw0KPiA+ID4gPiA+IC0gICAgICAgICAgICAg
ICAgICAgOiAgICAgICstLS0tLS0tLS0rICAgICAgICAgfCAgICAgICAgfA0KPiA+ID4gPiA+IC0g
ICAgICAgKy0tLS0tLS0tKyAgOiArLS0tPnwgQ2FjaGUgQSB8PC0tLS0tLS0+fCAgICAgICAgfA0K
PiA+ID4gPiA+IC0gICAgICAgfCAgICAgICAgfCAgOiB8ICAgICstLS0tLS0tLS0rICAgICAgICAg
fCAgICAgICAgfA0KPiA+ID4gPiA+IC0gICAgICAgfCAgQ1BVIDEgfDwtLS0rICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgICAgICAgfA0KPiA+ID4gPiA+IC0gICAgICAgfCAgICAgICAgfCAgOiB8
ICAgICstLS0tLS0tLS0rICAgICAgICAgfCAgICAgICAgfA0KPiA+ID4gPiA+IC0gICAgICAgKy0t
LS0tLS0tKyAgOiArLS0tPnwgQ2FjaGUgQiB8PC0tLS0tLS0+fCAgICAgICAgfA0KPiA+ID4gPiA+
IC0gICAgICAgICAgICAgICAgICAgOiAgICAgICstLS0tLS0tLS0rICAgICAgICAgfCAgICAgICAg
fA0KPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgOiAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCBNZW1vcnkgfA0KPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgOiAgICAgICstLS0t
LS0tLS0rICAgICAgICAgfCBTeXN0ZW0gfA0KPiA+ID4gPiA+IC0gICAgICAgKy0tLS0tLS0tKyAg
OiArLS0tPnwgQ2FjaGUgQyB8PC0tLS0tLS0+fCAgICAgICAgfA0KPiA+ID4gPiA+IC0gICAgICAg
fCAgICAgICAgfCAgOiB8ICAgICstLS0tLS0tLS0rICAgICAgICAgfCAgICAgICAgfA0KPiA+ID4g
PiA+IC0gICAgICAgfCAgQ1BVIDIgfDwtLS0rICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAg
ICAgfA0KPiA+ID4gPiA+IC0gICAgICAgfCAgICAgICAgfCAgOiB8ICAgICstLS0tLS0tLS0rICAg
ICAgICAgfCAgICAgICAgfA0KPiA+ID4gPiA+IC0gICAgICAgKy0tLS0tLS0tKyAgOiArLS0tPnwg
Q2FjaGUgRCB8PC0tLS0tLS0+fCAgICAgICAgfA0KPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAg
ICAgOiAgICAgICstLS0tLS0tLS0rICAgICAgICAgfCAgICAgICAgfA0KPiA+ID4gPiA+IC0gICAg
ICAgICAgICAgICAgICAgOiAgICAgICAgICAgICAgICAgICAgICAgICAgKy0tLS0tLS0tKw0KPiA+
ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgOg0KPiA+ID4gPiA+IC0NCj4gPiA+ID4gPiAt7J20
IOyLnOyKpO2FnOydtCDri6TsnYzqs7wg6rCZ7J2AIO2KueyEseydhCDqsJbripTri6Qg7IOd6rCB
7ZW0IOu0heyLnOuLpDoNCj4gPiA+ID4gPiAtDQo+ID4gPiA+ID4gLSAoKikg7ZmA7IiY67KIIOy6
kOyLnOudvOyduOydgCDsupDsi5wgQSwg7LqQ7IucIEMg65iQ64qUIOuplOuqqOumrOyXkCDsnITs
uZjtlaAg7IiYIOyeiOydjDsNCj4gPiA+ID4gPiAtDQo+ID4gPiA+ID4gLSAoKikg7Ked7IiY67KI
IOy6kOyLnOudvOyduOydgCDsupDsi5wgQiwg7LqQ7IucIEQg65iQ64qUIOuplOuqqOumrOyXkCDs
nITsuZjtlaAg7IiYIOyeiOydjDsNCj4gPiA+ID4gPiAtDQo+ID4gPiA+ID4gLSAoKikgQ1BVIOy9
lOyWtOqwgCDtlZzqsJzsnZgg7LqQ7Iuc7JeQIOygkeq3vO2VmOuKlCDrj5nslYgsIOuLpOuluCDs
upDsi5zripQgLSDrjZTti7Ag7LqQ7Iuc65287J247J2EDQo+ID4gPiA+ID4gLSAgICAg66mU66qo
66as7JeQIOuCtOumrOqxsOuCmCDstpTsuKHshLEg66Gc65Oc66W8IO2VmOqxsOuCmCDtlZjquLAg
7JyE7ZW0IC0g7Iuc7Iqk7YWc7J2YIOuLpOuluCDrtoDrtoTsl5ANCj4gPiA+ID4gPiAtICAgICDs
laHshLjsiqQg7ZWY6riwIOychO2VtCDrsoTsiqTrpbwg7IKs7Jqp7ZWgIOyImCDsnojsnYw7DQo+
ID4gPiA+ID4gLQ0KPiA+ID4gPiA+IC0gKCopIOqwgSDsupDsi5zripQg7Iuc7Iqk7YWc7J2YIOuC
mOuouOyngCDrtoDrtoTrk6Tqs7wg7J286rSA7ISx7J2EIOunnuy2lOq4sCDsnITtlbQg7ZW064u5
IOy6kOyLnOyXkA0KPiA+ID4gPiA+IC0gICAgIOyggeyaqeuQmOyWtOyVvCDtlaAg7Jik7Y2866CI
7J207IWY65Ok7J2YIO2BkOulvCDqsIDsp5A7DQo+ID4gPiA+ID4gLQ0KPiA+ID4gPiA+IC0gKCop
IOydtCDsnbzqtIDshLEg7YGQ64qUIOy6kOyLnOyXkCDsnbTrr7gg7KG07J6s7ZWY64qUIOudvOyd
uOyXkCDqsIDtlbTsp4DripQg7Y+J67KU7ZWcIOuhnOuTnOyXkCDsnZjtlbTshJzripQNCj4gPiA+
ID4gPiAtICAgICDruYTsm4zsp4Dsp4Ag7JWK64qU642wLCDtgZDsnZgg7Jik7Y2866CI7J207IWY
65Ok7J20IOydtCDroZzrk5zsnZgg6rKw6rO87JeQIOyYge2WpeydhCDrgbzsuaAg7IiYIOyeiOuL
pA0KPiA+ID4gPiA+IC0gICAgIO2VoOyngOudvOuPhCDqt7jrn6ztlaguDQo+ID4gPiA+ID4gLQ0K
PiA+ID4gPiA+IC3snbTsoJwsIOyyq+uyiOynuCBDUFUg7JeQ7IScIOuRkOqwnOydmCDsk7DquLAg
7Jik7Y2866CI7J207IWY7J2EIOunjOuTnOuKlOuNsCwg7ZW064u5IENQVSDsnZgg7LqQ7Iuc7JeQ
DQo+ID4gPiA+ID4gLeyalOyyreuQnCDsiJzshJzroZwg7Jik7Y2866CI7J207IWY7J20IOuPhOuL
rOuQqOydhCDrs7TsnqXtlZjquLAg7JyE7ZW0IOuRkCDsmKTtjbzroIjsnbTshZgg7IKs7J207JeQ
IOyTsOq4sA0KPiA+ID4gPiA+IC3rsLDrpqzslrTrpbwg7IKs7Jqp7ZWY64qUIOyDge2ZqeydhCDs
g4Hsg4HtlbQg67SF7Iuc64ukOg0KPiA+ID4gPiA+IC0NCj4gPiA+ID4gPiAtICAgICAgIENQVSAx
ICAgICAgICAgICBDUFUgMiAgICAgICAgICAgQ09NTUVOVA0KPiA+ID4gPiA+IC0gICAgICAgPT09
PT09PT09PT09PT09ID09PT09PT09PT09PT09PSA9PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0NCj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdSA9PSAwLCB2ID09IDEgYW5kIHAgPT0gJnUsIHEgPT0gJnUNCj4gPiA+ID4gPiAtICAg
ICAgIHYgPSAyOw0KPiA+ID4gPiA+IC0gICAgICAgc21wX3dtYigpOyAgICAgICAgICAgICAgICAg
ICAgICB2IOydmCDrs4Dqsr3snbQgcCDsnZgg67OA6rK9IOyghOyXkCDrs7Tsnbwg6rKD7J2EDQo+
ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICDrtoTrqoXt
nogg7ZWoDQo+ID4gPiA+ID4gLSAgICAgICA8QTptb2RpZnkgdj0yPiAgICAgICAgICAgICAgICAg
IHYg64qUIOydtOygnCDsupDsi5wgQSDsl5Ag64+F7KCQ7KCB7Jy866GcIOyhtOyerO2VqA0KPiA+
ID4gPiA+IC0gICAgICAgcCA9ICZ2Ow0KPiA+ID4gPiA+IC0gICAgICAgPEI6bW9kaWZ5IHA9JnY+
ICAgICAgICAgICAgICAgICBwIOuKlCDsnbTsoJwg7LqQ7IucIEIg7JeQIOuPheygkOyggeycvOuh
nCDsobTsnqztlagNCj4gPiA+ID4gPiAtDQo+ID4gPiA+ID4gLeyXrOq4sOyEnOydmCDsk7DquLAg
66mU66qo66asIOuwsOumrOyWtOuKlCBDUFUgMSDsnZgg7LqQ7Iuc6rCAIOyYrOuwlOuluCDsiJzs
hJzroZwg7JeF642w7J207Yq4IOuQnCDqsoPsnLzroZwNCj4gPiA+ID4gPiAt7Iuc7Iqk7YWc7J2Y
IOuLpOuluCBDUFUg65Ok7J20IOyduOyngO2VmOqyjCDrp4zrk63ri4jri6QuICDtlZjsp4Drp4ws
IOydtOygnCDrkZDrsojsp7ggQ1BVIOqwgCDqt7gg6rCS65Ok7J2EDQo+ID4gPiA+ID4gLeydveyc
vOugpCDtlZjripQg7IOB7Zmp7J2EIOyDneqwge2VtCDrtIXsi5zri6Q6DQo+ID4gPiA+ID4gLQ0K
PiA+ID4gPiA+IC0gICAgICAgQ1BVIDEgICAgICAgICAgIENQVSAyICAgICAgICAgICBDT01NRU5U
DQo+ID4gPiA+ID4gLSAgICAgICA9PT09PT09PT09PT09PT0gPT09PT09PT09PT09PT09ID09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+ID4gPiA+IC0gICAgICAgLi4u
DQo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgcSA9IHA7DQo+ID4gPiA+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICAgeCA9ICpxOw0KPiA+ID4gPiA+IC0NCj4gPiA+ID4gPiAt7JyE
7J2YIOuRkOqwnOydmCDsnb3quLAg7Jik7Y2866CI7J207IWY7J2AIOyYiOyDgeuQnCDsiJzshJzr
oZwg7J287Ja064KY7KeAIOuqu+2VoCDsiJgg7J6I64qU642wLCDrkZDrsojsp7ggQ1BVDQo+ID4g
PiA+ID4gLeydmCDtlZwg7LqQ7Iuc7JeQIOuLpOuluCDsupDsi5wg7J2067Kk7Yq46rCAIOuwnOyD
ne2VtCB2IOulvCDri7Tqs6Ag7J6I64qUIOy6kOyLnOudvOyduOydmCDtlbTri7kg7LqQ7Iuc7JeQ
7J2YDQo+ID4gPiA+ID4gLeyXheuNsOydtO2KuOqwgCDsp4Dsl7DrkJjripQg7IKs7J20LCBwIOul
vCDri7Tqs6Ag7J6I64qUIOy6kOyLnOudvOyduOydgCDrkZDrsojsp7ggQ1BVIOydmCDri6Trpbgg
7LqQ7Iuc7JeQDQo+ID4gPiA+ID4gLeyXheuNsOydtO2KuCDrkJjslrTrsoTroLjsnYQg7IiYIOye
iOq4sCDrlYzrrLjsnoXri4jri6QuDQo+ID4gPiA+ID4gLQ0KPiA+ID4gPiA+IC0gICAgICAgQ1BV
IDEgICAgICAgICAgIENQVSAyICAgICAgICAgICBDT01NRU5UDQo+ID4gPiA+ID4gLSAgICAgICA9
PT09PT09PT09PT09PT0gPT09PT09PT09PT09PT09ID09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQ0KPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1ID09IDAsIHYgPT0gMSBhbmQgcCA9PSAmdSwgcSA9PSAmdQ0KPiA+ID4gPiA+IC0g
ICAgICAgdiA9IDI7DQo+ID4gPiA+ID4gLSAgICAgICBzbXBfd21iKCk7DQo+ID4gPiA+ID4gLSAg
ICAgICA8QTptb2RpZnkgdj0yPiAgPEM6YnVzeT4NCj4gPiA+ID4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICA8QzpxdWV1ZSB2PTI+DQo+ID4gPiA+ID4gLSAgICAgICBwID0gJnY7ICAgICAgICAg
cSA9IHA7DQo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgPEQ6cmVxdWVzdCBwPg0K
PiA+ID4gPiA+IC0gICAgICAgPEI6bW9kaWZ5IHA9JnY+IDxEOmNvbW1pdCBwPSZ2Pg0KPiA+ID4g
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgIDxEOnJlYWQgcD4NCj4gPiA+ID4gPiAtICAgICAg
ICAgICAgICAgICAgICAgICB4ID0gKnE7DQo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAg
ICAgPEM6cmVhZCAqcT4gICAgIOy6kOyLnOyXkCDsl4XrjbDsnbTtirgg65CY6riwIOyghOydmCB2
IOulvCDsnb3snYwNCj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICA8Qzp1bmJ1c3k+
DQo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgPEM6Y29tbWl0IHY9Mj4NCj4gPiA+
ID4gPiAtDQo+ID4gPiA+ID4gLeq4sOuzuOyggeycvOuhnCwg65GQ6rCc7J2YIOy6kOyLnOudvOyd
uCDrqqjrkZAgQ1BVIDIg7JeQIOy1nOyiheyggeycvOuhnOuKlCDsl4XrjbDsnbTtirgg65CgIOqy
g+ydtOyngOunjCwNCj4gPiA+ID4gPiAt67OE64+E7J2YIOqwnOyehSDsl4bsnbTripQsIOyXheuN
sOydtO2KuOydmCDsiJzshJzqsIAgQ1BVIDEg7JeQ7IScIOunjOuTpOyWtOynhCDsiJzshJzsmYAg
64+Z7J287ZWgDQo+ID4gPiA+ID4gLeqyg+ydtOudvOuKlCDrs7TsnqXsnbQg7JeG7Iq164uI64uk
Lg0KPiA+ID4gPiA+IC0NCj4gPiA+ID4gPiAtDQo+ID4gPiA+ID4gLeyXrOq4sOyXkCDqsJzsnoXt
lZjquLAg7JyE7ZW07ISgLCDrjbDsnbTthLAg7J2Y7KG07ISxIOuwsOumrOyWtOuCmCDsnb3quLAg
67Cw66as7Ja066W8IOuhnOuTnCDsmKTtjbzroIjsnbTshZjrk6QNCj4gPiA+ID4gPiAt7IKs7J20
7JeQIOuEo+yWtOyVvCDtlanri4jri6QgKHY0LjE1IOu2gO2EsOuKlCBSRUFEX09OQ0UoKSDrp6Tt
gazroZzsl5Ag7J2Y7ZW0IOustOyhsOqxtOyggeycvOuhnA0KPiA+ID4gPiA+IC3qt7jroIfqsowg
65Cp64uI64ukKS4gIOydtOugh+qyjCDtlajsnLzroZzsjagg7LqQ7Iuc6rCAIOuLpOydjCDsmpTs
sq3snYQg7LKY66as7ZWY6riwIOyghOyXkCDsnbzqtIDshLEg7YGQ66W8DQo+ID4gPiA+ID4gLeyy
mOumrO2VmOuPhOuhnSDqsJXsoJztlZjqsowg65Cp64uI64ukLg0KPiA+ID4gPiA+IC0NCj4gPiA+
ID4gPiAtICAgICAgIENQVSAxICAgICAgICAgICBDUFUgMiAgICAgICAgICAgQ09NTUVOVA0KPiA+
ID4gPiA+IC0gICAgICAgPT09PT09PT09PT09PT09ID09PT09PT09PT09PT09PSA9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gPiA+ID4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdSA9PSAwLCB2ID09IDEgYW5kIHAgPT0gJnUsIHEgPT0g
JnUNCj4gPiA+ID4gPiAtICAgICAgIHYgPSAyOw0KPiA+ID4gPiA+IC0gICAgICAgc21wX3dtYigp
Ow0KPiA+ID4gPiA+IC0gICAgICAgPEE6bW9kaWZ5IHY9Mj4gIDxDOmJ1c3k+DQo+ID4gPiA+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgPEM6cXVldWUgdj0yPg0KPiA+ID4gPiA+IC0gICAgICAg
cCA9ICZ2OyAgICAgICAgIHEgPSBwOw0KPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
IDxEOnJlcXVlc3QgcD4NCj4gPiA+ID4gPiAtICAgICAgIDxCOm1vZGlmeSBwPSZ2PiA8RDpjb21t
aXQgcD0mdj4NCj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICA8RDpyZWFkIHA+DQo+
ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgc21wX3JlYWRfYmFycmllcl9kZXBlbmRz
KCkNCj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICA8Qzp1bmJ1c3k+DQo+ID4gPiA+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgPEM6Y29tbWl0IHY9Mj4NCj4gPiA+ID4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICB4ID0gKnE7DQo+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgPEM6cmVhZCAqcT4gICAgIOy6kOyLnOyXkCDsl4XrjbDsnbTtirgg65CcIHYg66W8IOyd
veydjA0KPiA+ID4gPiA+IC0NCj4gPiA+ID4gPiAtDQo+ID4gPiA+ID4gLeydtOufsCDrtoDrpZjs
nZgg66y47KCc64qUIERFQyBBbHBoYSDqs4Tsl7Qg7ZSE66Gc7IS47ISc65Ok7JeQ7IScIOuwnOqy
rOuQoCDsiJgg7J6I64qU642wLCDsnbTrk6TsnYANCj4gPiA+ID4gPiAt642w7J207YSwIOuyhOyK
pOulvCDsooAg642UIOyemCDsgqzsmqntlbQg7ISx64ql7J2EIOqwnOyEoO2VoCDsiJgg7J6I64qU
LCDrtoTtlaDrkJwg7LqQ7Iuc66W8IOqwgOyngOqzoCDsnojquLANCj4gPiA+ID4gPiAt65WM66y4
7J6F64uI64ukLiAg64yA67aA67aE7J2YIENQVSDripQg7ZWY64KY7J2YIOydveq4sCDsmKTtjbzr
oIjsnbTshZjsnZgg66mU66qo66asIOyVoeyEuOyKpOqwgCDri6Trpbgg7J296riwDQo+ID4gPiA+
ID4gLeyYpO2NvOugiOydtOyFmOyXkCDsnZjsobTsoIHsnbTrnbzrqbQg642w7J207YSwIOydmOyh
tOyEsSDrsLDrpqzslrTrpbwg64K07Y+s7Iuc7YK164uI64uk66eMLCDrqqjrkZDqsIAg6re465+w
6rG0DQo+ID4gPiA+ID4gLeyVhOuLiOq4sCDrlYzrrLjsl5Ag7J207KCQ7JeQIOydmOyhtO2VtOyE
oCDslYjrkKnri4jri6QuDQo+ID4gPiA+ID4gLQ0KPiA+ID4gPiA+IC3ri6TrpbggQ1BVIOuTpOuP
hCDrtoTtlaDrkJwg7LqQ7Iuc66W8IOqwgOyngOqzoCDsnojsnYQg7IiYIOyeiOyngOunjCwg6re4
65+wIENQVSDrk6TsnYAg7Y+J67KU7ZWcIOuplOuqqOumrA0KPiA+ID4gPiA+IC3slaHshLjsiqTr
pbwg7JyE7ZW07ISc64+EIOydtCDrtoTtlaDrkJwg7LqQ7Iuc65OkIOyCrOydtOydmCDsobDsoJXs
nYQg7ZW07JW866eMIO2VqeuLiOuLpC4gIEFscGhhIOuKlCDqsIDsnqUNCj4gPiA+ID4gPiAt7JW9
7ZWcIOuplOuqqOumrCDsiJzshJwg7Iuc66eo7YuxIChzZW1hbnRpYykg7J2EIOyEoO2Dne2VqOyc
vOuhnOyNqCDrqZTrqqjrpqwg67Cw66as7Ja06rCAIOuqheyLnOyggeycvOuhnA0KPiA+ID4gPiA+
IC3sgqzsmqnrkJjsp4Ag7JWK7JWY7J2EIOuVjOyXkOuKlCDqt7jrn7Ag7KGw7KCV7J20IO2VhOya
lO2VmOyngCDslYrqsowg7ZaI7Jy866mwLCDsnbTripQgQWxwaGEg6rCAIOuLueyLnOyXkA0KPiA+
ID4gPiA+IC3rjZQg64aS7J2AIENQVSDtgbTrnb0g7IaN64+E66W8IOqwgOyniCDsiJgg7J6I6rKM
IO2WiOyKteuLiOuLpC4gIO2VmOyngOunjCwgKOuLpOyLnCDrp5DtlZjqsbTrjIAsIHY0LjE1DQo+
ID4gPiA+ID4gLeydtO2bhOu2gO2EsOuKlCkgQWxwaGEg7JWE7YKk7YWN7LOQIOyghOyaqSDsvZTr
k5zsmYAgUkVBRF9PTkNFKCkg66ek7YGs66GcIOuCtOu2gOyXkOyEnOulvCDsoJzsmbjtlZjqs6Dr
ipQNCj4gPiA+ID4gPiAtc21wX3JlYWRfYmFycmllcl9kZXBlbmRzKCkg6rCAIOyCrOyaqeuQmOyn
gCDslYrslYTslbwg7ZWo7J2EIOyVjOyVhOuRkOyLnOq4sCDrsJTrno3ri4jri6QuDQo+ID4gPiA+
ID4gLQ0KPiA+ID4gPiA+IC0NCj4gPiA+ID4gPiAg7LqQ7IucIOydvOq0gOyEsSBWUyBETUENCj4g
PiA+ID4gPiAgLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBAQCAtMjk1
OSwxMCArMjgyMSw4IEBAIEFscGhhIENQVSDsnZgg7J2867aAIOuyhOyghOydgCDrtoTtlaDrkJwg
642w7J207YSwIOy6kOyLnOulvCDqsIDsp4Dqs6Ag7J6I7Ja07IScDQo+ID4gPiA+ID4gIOuNsOyd
tO2EsOydmCDrsJzqsqzsnYQg7Jis67CU66W4IOyInOyEnOuhnCDsnbzslrTrgpjqsowg7ZWY6riw
IOuVjOusuOyeheuLiOuLpC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+ICDrpqzriIXsiqQg7Luk64SQ
7J2YIOuplOuqqOumrCDrsLDrpqzslrQg66qo64247J2AIEFscGhhIOyXkCDquLDstIjtlbTshJwg
7KCV7J2Y65CY7JeI7Iq164uI64uk66eMLCB2NC4xNQ0KPiA+ID4gPiA+IC3rtoDthLDripQg66as
64iF7IqkIOy7pOuEkOydtCBSRUFEX09OQ0UoKSDrgrTsl5Agc21wX3JlYWRfYmFycmllcl9kZXBl
bmRzKCkg66W8IOy2lOqwgO2VtOyEnA0KPiA+ID4gPiA+IC1BbHBoYSDsnZgg66mU66qo66asIOuq
qOuNuOuhnOydmCDsmIHtlqXroKXsnbQg7YGs6rKMIOykhOyWtOuTpOq4tCDtlojsirXri4jri6Qu
DQo+ID4gPiA+ID4gLQ0KPiA+ID4gPiA+IC3snITsnZggIuy6kOyLnCDsnbzqtIDshLEiIOyEnOu4
jOyEueyFmOydhCDssLjqs6DtlZjshLjsmpQuDQo+ID4gPiA+ID4gK+u2gO2EsOuKlCBBbHBoYSDs
mqkgUkVBRF9PTkNFKCkg7L2U65OcIOuCtOyXkCBzbXBfbWIoKSDqsIAg7LaU6rCA65CY7Ja07ISc
IOuplOuqqOumrCDrqqjrjbjroZzsnZgNCj4gPiA+ID4gPiArQWxwaGEg7J2YIOyYge2Wpeugpeyd
tCDtgazqsowg7KSE7Ja065Ok7JeI7Iq164uI64ukLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4NCj4g
PiA+ID4gPiAg6rCA7IOBIOuouOyLoCDqsozsiqTtirgNCj4gPiA+ID4gPiAtLQ0KPiA+ID4gPiA+
IDIuMTcuMg0KPiA+ID4gPiA+DQo=
