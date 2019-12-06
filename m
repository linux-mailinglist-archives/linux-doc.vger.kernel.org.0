Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D62561158A3
	for <lists+linux-doc@lfdr.de>; Fri,  6 Dec 2019 22:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbfLFVaV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 6 Dec 2019 16:30:21 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33726 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfLFVaU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Dec 2019 16:30:20 -0500
Received: by mail-lf1-f66.google.com with SMTP id n25so6372500lfl.0;
        Fri, 06 Dec 2019 13:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Sbbo5VZoMr7GFtScQ7wFKANBjU9v7hpp98I0d5f2fys=;
        b=PoHjZP3s05kdEILYFNERC4qJtviVrIUBDbcbtetwxAAAFeZ5K5Mil21VGNOqc7I0aE
         UEflzwVL+Upa/N7KQCFwmxkVYf4UU7dfEmqKGWiDImYyoUSlvwoakv8v/FV14vHXQEFJ
         pAhsNOt3DJY9jLhdyQyoCn2IXVXC3uYzzC92+rapIKafEc5iNB0WpQYuyP1eop2gm/ZB
         6Wrh/0vk76D0NtwjnPl3ng99U7niwD2lS90ONu7BhHw9YRSacn4h1n0m2BHcU7KcyPcR
         ZTG6r4YsBoj8+4bRMznl8Od58GRkecBpmZQRImZH3+yt5HOD4uPXO0BO9VUhL/sPvjtC
         Sd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Sbbo5VZoMr7GFtScQ7wFKANBjU9v7hpp98I0d5f2fys=;
        b=tPOC2X9k46HMfCiGopQItbpdr+c2AyHEJdeAJVu+5BdHb5dr9AivTNDsz/0PIGq9JY
         BVYocs19laZaMRs3cIAQx1b9yHhvDtXLfPixeBnRJznwXlICtliesGWtxNKXf7/q3X/K
         lhtC3vQborqLt+XHGTmBD5CUvGd8qqTypXfR/YWRVpI7DbVM6mHz6m4jqGncpc4cUDTU
         gDE6CL4XgbMjELhImoyLuCD4b/eQCmBj2Wg0giPGbldI+mT773b9pLmw1IaPy+khG1nL
         Ni5mhaGTi24vv4QiaIHru3lKM+NNl0O+M9mB3XJnwDvt0g667AosYKcdBvIhdHX0uGte
         yjXA==
X-Gm-Message-State: APjAAAVwS9Nsuw1Cb8xUkAbXZGNaxpbE1ixHhMZ+YIiXUWwoH+6WsROq
        GUzpIF2Bqg7hWU8DwQxu2kp21SKmW/9UishrkI0=
X-Google-Smtp-Source: APXvYqzZyBW//bTKWlFVqDRSJQzk0bbOLYT2UKtNHIZVH+Kl9TiGgihO5AOE+F9SqL1IiEP8NKv/PjgpuW6m4vBo8ek=
X-Received: by 2002:a19:7015:: with SMTP id h21mr8901967lfc.68.1575667816880;
 Fri, 06 Dec 2019 13:30:16 -0800 (PST)
MIME-Version: 1.0
References: <20191121193209.15687-1-sj38.park@gmail.com> <20191129180837.7233-1-sjpark@amazon.de>
 <CAEjAshpsnrfkb83738rtkPbQohoFP0LZbP_45rUqyBX-RvsVwg@mail.gmail.com> <20191206204406.GK2889@paulmck-ThinkPad-P72>
In-Reply-To: <20191206204406.GK2889@paulmck-ThinkPad-P72>
From:   SeongJae Park <sj38.park@gmail.com>
Date:   Fri, 6 Dec 2019 22:29:50 +0100
Message-ID: <CAEjAshrGRafO4-k0tDD_XjC8EDq11AOh3PX+bPUhrjkuo+N76A@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation/barriers/kokr: Remove references to [smp_]read_barrier_depends()
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Will Deacon <will@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>, notify@kernel.org,
        SeongJae Park <sjpark@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gRnJpLCBEZWMgNiwgMjAxOSBhdCA5OjQ0IFBNIFBhdWwgRS4gTWNLZW5uZXkgPHBhdWxtY2tA
a2VybmVsLm9yZz4gd3JvdGU6DQo+DQo+IE9uIEZyaSwgRGVjIDA2LCAyMDE5IGF0IDA2OjIwOjUx
UE0gKzAxMDAsIFNlb25nSmFlIFBhcmsgd3JvdGU6DQo+ID4gSGVsbG8gUGF1bCBhbmQgV2lsbCwN
Cj4gPg0KPiA+IE9uIEZyaSwgTm92IDI5LCAyMDE5IGF0IDc6MDkgUE0gU2VvbmdKYWUgUGFyayA8
c2ozOC5wYXJrQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gUGF1bCwgdGhhbmsgeW91
IGZvciB3YWl0aW5nIGxvbmcuICBJIGdvdCByZXZpZXdlZCBieSBhbm90aGVyIEtvcmVhbg0KPiA+
ID4gaGFja2VyLCBZdW5qYWUuDQo+ID4gPg0KPiA+ID4gQ2hhbmdlcyBmcm9tIHYxIChodHRwczov
L2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkxMTIxMTkzMjA5LjE1Njg3LTEtc2ozOC5wYXJrQGdt
YWlsLmNvbS8pDQo+ID4gPiAtIEdldCBhIHJldmlldyBmcm9tIFl1bmphZQ0KPiA+ID4gLSBNaW5v
ciB3b3Jkc21pdGggYmFzZWQgb24gdGhlIHJldmlldyBjb21tZW50DQo+ID4gPiAtIFJlYmFzZWQg
b24gZ2l0Oi8vZ2l0Lmx3bi5uZXQvbGludXguZ2l0IHRhZ3MvZG9jcy01LjUNCj4gPiA+IC0gVXBk
YXRlIGF1dGhvcidzIGVtYWlsIGFkZHJlc3MNCj4gPg0KPiA+IE1heSBJIGFzayB5b3VyIGNvbW1l
bnRzPw0KPg0KPiBJIHRob3VnaHQgdGhhdCBKb24gQ29yYmV0IGhhZCBhbHJlYWR5IHF1ZXVlZCB0
aGVzZS4gIERpZCBJIG1pc3Mgc29tZT8NCg0KVGhpcyBwYXRjaCBoYXMgbm90IHF1ZXVlZCBieSBK
b24sIGluZGVlZC4gIEkgaGF2ZW4ndCBDQy1lZCBuZWl0aGVyIEpvbiwgbm9yDQpsaW51eC1kb2Mg
Zm9yIHRoZSAxc3QgdmVyc2lvbiBvZiB0aGlzIHBhdGNoIGJlY2F1c2UgdGhpcyBpcyBhIGZvbGxv
d3VwIG9mDQpXaWxsJ3MgcGF0Y2hbMV0gYW5kIHRoZSBXaWxsJ3MgcGF0Y2ggYWxzbyBoYXZlIG5v
dCBDQy1lZCB0aGVtLg0KDQpJIHNlbnQgYW5vdGhlciBwYXRjaHNldFsyXSBmb3IgZG9jdW1lbnRz
IHNpbXVsdGFuZW91c2x5IGJ1dCBDQy1lZCBKb24gYW5kDQpsaW51eC1kb2MgZm9yIHRoZSBwYXRj
aCwgYmVjYXVzZSB0aGUgcGF0Y2hzZXQgaXMgYSBmb2xsb3d1cCBvZiB0aGUgY29tbWl0cw0Kd2hp
Y2ggYWxyZWFkeSBtZXJnZWQgaW4gVG9ydmFsZHMncyB0cmVlLiAgVGhlIHBhdGNoc2V0IGhhcyBx
dWV1ZWQgYnkgYm90aCBvZg0KeW91IGFuZCB0aGVuIHlvdSBhZ3JlZWQgdG8gbWVyZ2UgaXQgYnkg
Sm9uJ3MgdHJlZS4gIEkgZ3Vlc3MgSSBtYWRlIHRoZQ0KY29uZnVzaW9uIGluIHRoaXMgd2F5LiAg
U29ycnkgZm9yIG1ha2luZyBzdWNoIGNvbmZ1c2lvbi4gIEFueXdheSwgdGhpcyBwYXRjaA0KaXMg
bm90IHF1ZXVlZCBpbiBhbnkgdHJlZSwgQUZJSy4NCg0KDQpUaGFua3MsDQpTZW9uZ0phZSBQYXJr
DQoNCg0KWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxOTExMDgxNzAxMjAuMjIz
MzEtMTAtd2lsbEBrZXJuZWwub3JnLw0KWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LWRvYy8yMDE5MTEyMTIzNDEyNS4yODAzMi0xLXNqMzgucGFya0BnbWFpbC5jb20vDQoNCj4NCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBU
aGFueCwgUGF1bA0KPg0KPiA+IFRoYW5rcywNCj4gPiBTZW9uZ0phZSBQYXJrDQo+ID4NCj4gPiA+
DQo+ID4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gPjggLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+DQo+ID4gPiBUaGlzIGNvbW1pdCB0
cmFuc2xhdGVzIGNvbW1pdCA4MDg4NjE2ZDRjYTYgKCJEb2N1bWVudGF0aW9uL2JhcnJpZXJzOg0K
PiA+ID4gUmVtb3ZlIHJlZmVyZW5jZXMgdG8gW3NtcF9dcmVhZF9iYXJyaWVyX2RlcGVuZHMoKSIp
IG9mIFdpbGwncyB0cmVlWzFdDQo+ID4gPiBpbnRvIEtvcmVhbi4NCj4gPiA+DQo+ID4gPiBbMV0g
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvd2lsbC9saW51
eC5naXQvY29tbWl0L0RvY3VtZW50YXRpb24vbWVtb3J5LWJhcnJpZXJzLnR4dD9oPWx0byZpZD04
MDg4NjE2ZDRjYTYxY2Q2Yjc3MDIyNWYzMGZlYzY2YzZmNjc2N2ZiDQo+ID4gPg0KPiA+ID4gU2ln
bmVkLW9mZi1ieTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4NCj4gPiA+IFJldmll
d2VkLWJ5OiBZdW5qYWUgTGVlIDxseWo3Njk0QGdtYWlsLmNvbT4NCj4gPiA+DQo+ID4gPiAtLS0N
Cj4gPiA+ICAuLi4vdHJhbnNsYXRpb25zL2tvX0tSL21lbW9yeS1iYXJyaWVycy50eHQgICAgfCAx
NDYgKy0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMTQzIGRlbGV0aW9ucygtKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy9rb19LUi9tZW1vcnktYmFycmllcnMudHh0IGIvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMva29fS1IvbWVtb3J5LWJhcnJpZXJzLnR4dA0KPiA+ID4gaW5kZXgg
ZjA3YzQwYTA2OGI1Li5hOGQyNmRmOTM2MGIgMTAwNjQ0DQo+ID4gPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy9rb19LUi9tZW1vcnktYmFycmllcnMudHh0DQo+ID4gPiArKysgYi9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy9rb19LUi9tZW1vcnktYmFycmllcnMudHh0DQo+ID4g
PiBAQCAtNTc3LDcgKzU3Nyw3IEBAIEFDUVVJUkUg64qUIO2VtOuLuSDsmKTtjbzroIjsnbTshZjs
nZgg66Gc65OcIOu2gOu2hOyXkOunjCDsoIHsmqnrkJjqs6AgUkVMRUFTRQ0KPiA+ID4gIOuNsOyd
tO2EsCDsnZjsobTshLEg67Cw66as7Ja0ICjsl63sgqzsoIEpDQo+ID4gPiAgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+DQo+ID4gPiAt66as64iF7IqkIOy7pOuEkCB2NC4xNSDq
uLDspIDsnLzroZwsIHNtcF9yZWFkX2JhcnJpZXJfZGVwZW5kcygpIOqwgCBSRUFEX09OQ0UoKSDs
l5ANCj4gPiA+ICvrpqzriIXsiqQg7Luk64SQIHY0LjE1IOq4sOykgOycvOuhnCwgc21wX21iKCkg
6rCAIERFQyBBbHBoYSDsmqkgUkVBRF9PTkNFKCkg7L2U65Oc7JeQDQo+ID4gPiAg7LaU6rCA65CY
7JeI64qU642wLCDsnbTripQg7J20IOyEueyFmOyXkCDso7zsnZjrpbwg6riw7Jq47Jes7JW8IO2V
mOuKlCDsgqzrnozrk6TsnYAgREVDIEFscGhhIOyVhO2CpO2FjeyzkA0KPiA+ID4gIOyghOyaqSDs
vZTrk5zrpbwg66eM65Oc64qUIOyCrOuejOuTpOqzvCBSRUFEX09OQ0UoKSDsnpDssrTrpbwg66eM
65Oc64qUIOyCrOuejOuTpCDrv5DsnoTsnYQg7J2Y66+47ZWp64uI64ukLg0KPiA+ID4gIOq3uOuf
sCDrtoTrk6TsnYQg7JyE7ZW0LCDqt7jrpqzqs6Ag7Jet7IKs7JeQIOq0gOyLrCDsnojripQg67aE
65Ok7J2EIOychO2VtCwg7Jes6riwIOuNsOydtO2EsCDsnZjsobTshLENCj4gPiA+IEBAIC0yNjYx
LDE0NCArMjY2MSw2IEBAIENQVSDsvZTslrTripQg7ZSE66Gc6re4656o7J2YIOyduOqzvOyEseyd
tCDsnKDsp4DrkJzri6Tqs6Drp4wg7Jes6rKo7KeE64uk66m0DQo+ID4gPiAg7IiY64+EIOyeiOyK
teuLiOuLpC4NCj4gPiA+DQo+ID4gPg0KPiA+ID4gLey6kOyLnCDsnbzqtIDshLENCj4gPiA+IC0t
LS0tLS0tLS0tLQ0KPiA+ID4gLQ0KPiA+ID4gLe2VmOyngOunjCDsgrbsnYAg7JWe7JeQ7IScIOyd
tOyVvOq4sO2VnCDqsoPsspjrn7wg64uo7Iic7ZWY7KeAIOyViuyKteuLiOuLpDog7LqQ7Iuc65Ok
7J2AIOydvOq0gOyggeydvCDqsoPsnLzroZwNCj4gPiA+IC3quLDrjIDrkJjsp4Drp4wsIOq3uCDs
nbzqtIDshLHsnbQg7Iic7ISc7JeQ64+EIOyggeyaqeuQoCDqsbDrnbzripQg67O07J6l7J2AIOyX
huyKteuLiOuLpC4gIO2VnCBDUFUg7JeQ7IScDQo+ID4gPiAt66eM65Ok7Ja07KeEIOuzgOqyvSDs
gqztla3snYAg7LWc7KKF7KCB7Jy866Gc64qUIOyLnOyKpO2FnOydmCDrqqjrk6AgQ1BVIOyXkOqy
jCDrs7Tsl6zsp4Dqsowg65CY7KeA66eMLCDri6TrpbgNCj4gPiA+IC1DUFUg65Ok7JeQ6rKM64+E
IOqwmeydgCDsiJzshJzroZwg67O07J206rKMIOuQoCDqsbDrnbzripQg67O07J6l7J2AIOyXhuuL
pOuKlCDrnLvsnoXri4jri6QuDQo+ID4gPiAtDQo+ID4gPiAtDQo+ID4gPiAt65GQ6rCc7J2YIENQ
VSAoMSAmIDIpIOqwgCDri6zroKQg7J6I6rOgLCDqsIEgQ1BVIOyXkCDrkZDqsJzsnZgg642w7J20
7YSwIOy6kOyLnChDUFUgMSDsnYAgQS9CIOulvCwNCj4gPiA+IC1DUFUgMiDripQgQy9EIOulvCDq
sJbsirXri4jri6Qp6rCAIOuzkeugrOuhnCDsl7DqsrDrkJjslrQg7J6I64qUIOyLnOyKpO2FnOyd
hCDri6Tro6zri6Tqs6Ag7IOd6rCB7ZW0DQo+ID4gPiAt67SF7Iuc64ukOg0KPiA+ID4gLQ0KPiA+
ID4gLSAgICAgICAgICAgICAgICAgICA6DQo+ID4gPiAtICAgICAgICAgICAgICAgICAgIDogICAg
ICAgICAgICAgICAgICAgICAgICAgICstLS0tLS0tLSsNCj4gPiA+IC0gICAgICAgICAgICAgICAg
ICAgOiAgICAgICstLS0tLS0tLS0rICAgICAgICAgfCAgICAgICAgfA0KPiA+ID4gLSAgICAgICAr
LS0tLS0tLS0rICA6ICstLS0+fCBDYWNoZSBBIHw8LS0tLS0tLT58ICAgICAgICB8DQo+ID4gPiAt
ICAgICAgIHwgICAgICAgIHwgIDogfCAgICArLS0tLS0tLS0tKyAgICAgICAgIHwgICAgICAgIHwN
Cj4gPiA+IC0gICAgICAgfCAgQ1BVIDEgfDwtLS0rICAgICAgICAgICAgICAgICAgICAgICAgfCAg
ICAgICAgfA0KPiA+ID4gLSAgICAgICB8ICAgICAgICB8ICA6IHwgICAgKy0tLS0tLS0tLSsgICAg
ICAgICB8ICAgICAgICB8DQo+ID4gPiAtICAgICAgICstLS0tLS0tLSsgIDogKy0tLT58IENhY2hl
IEIgfDwtLS0tLS0tPnwgICAgICAgIHwNCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgOiAgICAg
ICstLS0tLS0tLS0rICAgICAgICAgfCAgICAgICAgfA0KPiA+ID4gLSAgICAgICAgICAgICAgICAg
ICA6ICAgICAgICAgICAgICAgICAgICAgICAgICB8IE1lbW9yeSB8DQo+ID4gPiAtICAgICAgICAg
ICAgICAgICAgIDogICAgICArLS0tLS0tLS0tKyAgICAgICAgIHwgU3lzdGVtIHwNCj4gPiA+IC0g
ICAgICAgKy0tLS0tLS0tKyAgOiArLS0tPnwgQ2FjaGUgQyB8PC0tLS0tLS0+fCAgICAgICAgfA0K
PiA+ID4gLSAgICAgICB8ICAgICAgICB8ICA6IHwgICAgKy0tLS0tLS0tLSsgICAgICAgICB8ICAg
ICAgICB8DQo+ID4gPiAtICAgICAgIHwgIENQVSAyIHw8LS0tKyAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICAgICAgIHwNCj4gPiA+IC0gICAgICAgfCAgICAgICAgfCAgOiB8ICAgICstLS0tLS0t
LS0rICAgICAgICAgfCAgICAgICAgfA0KPiA+ID4gLSAgICAgICArLS0tLS0tLS0rICA6ICstLS0+
fCBDYWNoZSBEIHw8LS0tLS0tLT58ICAgICAgICB8DQo+ID4gPiAtICAgICAgICAgICAgICAgICAg
IDogICAgICArLS0tLS0tLS0tKyAgICAgICAgIHwgICAgICAgIHwNCj4gPiA+IC0gICAgICAgICAg
ICAgICAgICAgOiAgICAgICAgICAgICAgICAgICAgICAgICAgKy0tLS0tLS0tKw0KPiA+ID4gLSAg
ICAgICAgICAgICAgICAgICA6DQo+ID4gPiAtDQo+ID4gPiAt7J20IOyLnOyKpO2FnOydtCDri6Ts
nYzqs7wg6rCZ7J2AIO2KueyEseydhCDqsJbripTri6Qg7IOd6rCB7ZW0IOu0heyLnOuLpDoNCj4g
PiA+IC0NCj4gPiA+IC0gKCopIO2ZgOyImOuyiCDsupDsi5zrnbzsnbjsnYAg7LqQ7IucIEEsIOy6
kOyLnCBDIOuYkOuKlCDrqZTrqqjrpqzsl5Ag7JyE7LmY7ZWgIOyImCDsnojsnYw7DQo+ID4gPiAt
DQo+ID4gPiAtICgqKSDsp53siJjrsogg7LqQ7Iuc65287J247J2AIOy6kOyLnCBCLCDsupDsi5wg
RCDrmJDripQg66mU66qo66as7JeQIOychOy5mO2VoCDsiJgg7J6I7J2MOw0KPiA+ID4gLQ0KPiA+
ID4gLSAoKikgQ1BVIOy9lOyWtOqwgCDtlZzqsJzsnZgg7LqQ7Iuc7JeQIOygkeq3vO2VmOuKlCDr
j5nslYgsIOuLpOuluCDsupDsi5zripQgLSDrjZTti7Ag7LqQ7Iuc65287J247J2EDQo+ID4gPiAt
ICAgICDrqZTrqqjrpqzsl5Ag64K066as6rGw64KYIOy2lOy4oeyEsSDroZzrk5zrpbwg7ZWY6rGw
64KYIO2VmOq4sCDsnITtlbQgLSDsi5zsiqTthZzsnZgg64uk66W4IOu2gOu2hOyXkA0KPiA+ID4g
LSAgICAg7JWh7IS47IqkIO2VmOq4sCDsnITtlbQg67KE7Iqk66W8IOyCrOyaqe2VoCDsiJgg7J6I
7J2MOw0KPiA+ID4gLQ0KPiA+ID4gLSAoKikg6rCBIOy6kOyLnOuKlCDsi5zsiqTthZzsnZgg64KY
66i47KeAIOu2gOu2hOuTpOqzvCDsnbzqtIDshLHsnYQg66ee7LaU6riwIOychO2VtCDtlbTri7kg
7LqQ7Iuc7JeQDQo+ID4gPiAtICAgICDsoIHsmqnrkJjslrTslbwg7ZWgIOyYpO2NvOugiOydtOyF
mOuTpOydmCDtgZDrpbwg6rCA7KeQOw0KPiA+ID4gLQ0KPiA+ID4gLSAoKikg7J20IOydvOq0gOyE
sSDtgZDripQg7LqQ7Iuc7JeQIOydtOuvuCDsobTsnqztlZjripQg65287J247JeQIOqwgO2VtOyn
gOuKlCDtj4nrspTtlZwg66Gc65Oc7JeQIOydmO2VtOyEnOuKlA0KPiA+ID4gLSAgICAg67mE7JuM
7KeA7KeAIOyViuuKlOuNsCwg7YGQ7J2YIOyYpO2NvOugiOydtOyFmOuTpOydtCDsnbQg66Gc65Oc
7J2YIOqysOqzvOyXkCDsmIHtlqXsnYQg64G87LmgIOyImCDsnojri6QNCj4gPiA+IC0gICAgIO2V
oOyngOudvOuPhCDqt7jrn6ztlaguDQo+ID4gPiAtDQo+ID4gPiAt7J207KCcLCDssqvrsojsp7gg
Q1BVIOyXkOyEnCDrkZDqsJzsnZgg7JOw6riwIOyYpO2NvOugiOydtOyFmOydhCDrp4zrk5zripTr
jbAsIO2VtOuLuSBDUFUg7J2YIOy6kOyLnOyXkA0KPiA+ID4gLeyalOyyreuQnCDsiJzshJzroZwg
7Jik7Y2866CI7J207IWY7J20IOuPhOuLrOuQqOydhCDrs7TsnqXtlZjquLAg7JyE7ZW0IOuRkCDs
mKTtjbzroIjsnbTshZgg7IKs7J207JeQIOyTsOq4sA0KPiA+ID4gLeuwsOumrOyWtOulvCDsgqzs
mqntlZjripQg7IOB7Zmp7J2EIOyDgeyDge2VtCDrtIXsi5zri6Q6DQo+ID4gPiAtDQo+ID4gPiAt
ICAgICAgIENQVSAxICAgICAgICAgICBDUFUgMiAgICAgICAgICAgQ09NTUVOVA0KPiA+ID4gLSAg
ICAgICA9PT09PT09PT09PT09PT0gPT09PT09PT09PT09PT09ID09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQ0KPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHUgPT0gMCwgdiA9PSAxIGFuZCBwID09ICZ1LCBxID09ICZ1DQo+ID4gPiAtICAg
ICAgIHYgPSAyOw0KPiA+ID4gLSAgICAgICBzbXBfd21iKCk7ICAgICAgICAgICAgICAgICAgICAg
IHYg7J2YIOuzgOqyveydtCBwIOydmCDrs4Dqsr0g7KCE7JeQIOuztOydvCDqsoPsnYQNCj4gPiA+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg67aE66qF7Z6IIO2VqA0K
PiA+ID4gLSAgICAgICA8QTptb2RpZnkgdj0yPiAgICAgICAgICAgICAgICAgIHYg64qUIOydtOyg
nCDsupDsi5wgQSDsl5Ag64+F7KCQ7KCB7Jy866GcIOyhtOyerO2VqA0KPiA+ID4gLSAgICAgICBw
ID0gJnY7DQo+ID4gPiAtICAgICAgIDxCOm1vZGlmeSBwPSZ2PiAgICAgICAgICAgICAgICAgcCDr
ipQg7J207KCcIOy6kOyLnCBCIOyXkCDrj4XsoJDsoIHsnLzroZwg7KG07J6s7ZWoDQo+ID4gPiAt
DQo+ID4gPiAt7Jes6riw7ISc7J2YIOyTsOq4sCDrqZTrqqjrpqwg67Cw66as7Ja064qUIENQVSAx
IOydmCDsupDsi5zqsIAg7Jis67CU66W4IOyInOyEnOuhnCDsl4XrjbDsnbTtirgg65CcIOqyg+yc
vOuhnA0KPiA+ID4gLeyLnOyKpO2FnOydmCDri6TrpbggQ1BVIOuTpOydtCDsnbjsp4DtlZjqsowg
66eM65Ot64uI64ukLiAg7ZWY7KeA66eMLCDsnbTsoJwg65GQ67KI7Ke4IENQVSDqsIAg6re4IOqw
kuuTpOydhA0KPiA+ID4gLeydveycvOugpCDtlZjripQg7IOB7Zmp7J2EIOyDneqwge2VtCDrtIXs
i5zri6Q6DQo+ID4gPiAtDQo+ID4gPiAtICAgICAgIENQVSAxICAgICAgICAgICBDUFUgMiAgICAg
ICAgICAgQ09NTUVOVA0KPiA+ID4gLSAgICAgICA9PT09PT09PT09PT09PT0gPT09PT09PT09PT09
PT09ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+ID4gLSAgICAg
ICAuLi4NCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHEgPSBwOw0KPiA+ID4gLSAgICAg
ICAgICAgICAgICAgICAgICAgeCA9ICpxOw0KPiA+ID4gLQ0KPiA+ID4gLeychOydmCDrkZDqsJzs
nZgg7J296riwIOyYpO2NvOugiOydtOyFmOydgCDsmIjsg4HrkJwg7Iic7ISc66GcIOydvOyWtOuC
mOyngCDrqrvtlaAg7IiYIOyeiOuKlOuNsCwg65GQ67KI7Ke4IENQVQ0KPiA+ID4gLeydmCDtlZwg
7LqQ7Iuc7JeQIOuLpOuluCDsupDsi5wg7J2067Kk7Yq46rCAIOuwnOyDne2VtCB2IOulvCDri7Tq
s6Ag7J6I64qUIOy6kOyLnOudvOyduOydmCDtlbTri7kg7LqQ7Iuc7JeQ7J2YDQo+ID4gPiAt7JeF
642w7J207Yq46rCAIOyngOyXsOuQmOuKlCDsgqzsnbQsIHAg66W8IOuLtOqzoCDsnojripQg7LqQ
7Iuc65287J247J2AIOuRkOuyiOynuCBDUFUg7J2YIOuLpOuluCDsupDsi5zsl5ANCj4gPiA+IC3s
l4XrjbDsnbTtirgg65CY7Ja067KE66C47J2EIOyImCDsnojquLAg65WM66y47J6F64uI64ukLg0K
PiA+ID4gLQ0KPiA+ID4gLSAgICAgICBDUFUgMSAgICAgICAgICAgQ1BVIDIgICAgICAgICAgIENP
TU1FTlQNCj4gPiA+IC0gICAgICAgPT09PT09PT09PT09PT09ID09PT09PT09PT09PT09PSA9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1ID09IDAsIHYgPT0gMSBhbmQgcCA9PSAmdSwgcSA9
PSAmdQ0KPiA+ID4gLSAgICAgICB2ID0gMjsNCj4gPiA+IC0gICAgICAgc21wX3dtYigpOw0KPiA+
ID4gLSAgICAgICA8QTptb2RpZnkgdj0yPiAgPEM6YnVzeT4NCj4gPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgIDxDOnF1ZXVlIHY9Mj4NCj4gPiA+IC0gICAgICAgcCA9ICZ2OyAgICAgICAgIHEg
PSBwOw0KPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgPEQ6cmVxdWVzdCBwPg0KPiA+ID4g
LSAgICAgICA8Qjptb2RpZnkgcD0mdj4gPEQ6Y29tbWl0IHA9JnY+DQo+ID4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICA8RDpyZWFkIHA+DQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICB4
ID0gKnE7DQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICA8QzpyZWFkICpxPiAgICAg7LqQ
7Iuc7JeQIOyXheuNsOydtO2KuCDrkJjquLAg7KCE7J2YIHYg66W8IOydveydjA0KPiA+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICAgPEM6dW5idXN5Pg0KPiA+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgPEM6Y29tbWl0IHY9Mj4NCj4gPiA+IC0NCj4gPiA+IC3quLDrs7jsoIHsnLzroZwsIOuR
kOqwnOydmCDsupDsi5zrnbzsnbgg66qo65GQIENQVSAyIOyXkCDstZzsooXsoIHsnLzroZzripQg
7JeF642w7J207Yq4IOuQoCDqsoPsnbTsp4Drp4wsDQo+ID4gPiAt67OE64+E7J2YIOqwnOyehSDs
l4bsnbTripQsIOyXheuNsOydtO2KuOydmCDsiJzshJzqsIAgQ1BVIDEg7JeQ7IScIOunjOuTpOyW
tOynhCDsiJzshJzsmYAg64+Z7J287ZWgDQo+ID4gPiAt6rKD7J20652864qUIOuztOyepeydtCDs
l4bsirXri4jri6QuDQo+ID4gPiAtDQo+ID4gPiAtDQo+ID4gPiAt7Jes6riw7JeQIOqwnOyehe2V
mOq4sCDsnITtlbTshKAsIOuNsOydtO2EsCDsnZjsobTshLEg67Cw66as7Ja064KYIOydveq4sCDr
sLDrpqzslrTrpbwg66Gc65OcIOyYpO2NvOugiOydtOyFmOuTpA0KPiA+ID4gLeyCrOydtOyXkCDr
hKPslrTslbwg7ZWp64uI64ukICh2NC4xNSDrtoDthLDripQgUkVBRF9PTkNFKCkg66ek7YGs66Gc
7JeQIOydmO2VtCDrrLTsobDqsbTsoIHsnLzroZwNCj4gPiA+IC3qt7jroIfqsowg65Cp64uI64uk
KS4gIOydtOugh+qyjCDtlajsnLzroZzsjagg7LqQ7Iuc6rCAIOuLpOydjCDsmpTssq3snYQg7LKY
66as7ZWY6riwIOyghOyXkCDsnbzqtIDshLEg7YGQ66W8DQo+ID4gPiAt7LKY66as7ZWY64+E66Gd
IOqwleygnO2VmOqyjCDrkKnri4jri6QuDQo+ID4gPiAtDQo+ID4gPiAtICAgICAgIENQVSAxICAg
ICAgICAgICBDUFUgMiAgICAgICAgICAgQ09NTUVOVA0KPiA+ID4gLSAgICAgICA9PT09PT09PT09
PT09PT0gPT09PT09PT09PT09PT09ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PQ0KPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUgPT0g
MCwgdiA9PSAxIGFuZCBwID09ICZ1LCBxID09ICZ1DQo+ID4gPiAtICAgICAgIHYgPSAyOw0KPiA+
ID4gLSAgICAgICBzbXBfd21iKCk7DQo+ID4gPiAtICAgICAgIDxBOm1vZGlmeSB2PTI+ICA8Qzpi
dXN5Pg0KPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgPEM6cXVldWUgdj0yPg0KPiA+ID4g
LSAgICAgICBwID0gJnY7ICAgICAgICAgcSA9IHA7DQo+ID4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICA8RDpyZXF1ZXN0IHA+DQo+ID4gPiAtICAgICAgIDxCOm1vZGlmeSBwPSZ2PiA8RDpjb21t
aXQgcD0mdj4NCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIDxEOnJlYWQgcD4NCj4gPiA+
IC0gICAgICAgICAgICAgICAgICAgICAgIHNtcF9yZWFkX2JhcnJpZXJfZGVwZW5kcygpDQo+ID4g
PiAtICAgICAgICAgICAgICAgICAgICAgICA8Qzp1bmJ1c3k+DQo+ID4gPiAtICAgICAgICAgICAg
ICAgICAgICAgICA8Qzpjb21taXQgdj0yPg0KPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
eCA9ICpxOw0KPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgPEM6cmVhZCAqcT4gICAgIOy6
kOyLnOyXkCDsl4XrjbDsnbTtirgg65CcIHYg66W8IOydveydjA0KPiA+ID4gLQ0KPiA+ID4gLQ0K
PiA+ID4gLeydtOufsCDrtoDrpZjsnZgg66y47KCc64qUIERFQyBBbHBoYSDqs4Tsl7Qg7ZSE66Gc
7IS47ISc65Ok7JeQ7IScIOuwnOqyrOuQoCDsiJgg7J6I64qU642wLCDsnbTrk6TsnYANCj4gPiA+
IC3rjbDsnbTthLAg67KE7Iqk66W8IOyigCDrjZQg7J6YIOyCrOyaqe2VtCDshLHriqXsnYQg6rCc
7ISg7ZWgIOyImCDsnojripQsIOu2hO2VoOuQnCDsupDsi5zrpbwg6rCA7KeA6rOgIOyeiOq4sA0K
PiA+ID4gLeuVjOusuOyeheuLiOuLpC4gIOuMgOu2gOu2hOydmCBDUFUg64qUIO2VmOuCmOydmCDs
nb3quLAg7Jik7Y2866CI7J207IWY7J2YIOuplOuqqOumrCDslaHshLjsiqTqsIAg64uk66W4IOyd
veq4sA0KPiA+ID4gLeyYpO2NvOugiOydtOyFmOyXkCDsnZjsobTsoIHsnbTrnbzrqbQg642w7J20
7YSwIOydmOyhtOyEsSDrsLDrpqzslrTrpbwg64K07Y+s7Iuc7YK164uI64uk66eMLCDrqqjrkZDq
sIAg6re465+w6rG0DQo+ID4gPiAt7JWE64uI6riwIOuVjOusuOyXkCDsnbTsoJDsl5Ag7J2Y7KG0
7ZW07ISgIOyViOuQqeuLiOuLpC4NCj4gPiA+IC0NCj4gPiA+IC3ri6TrpbggQ1BVIOuTpOuPhCDr
toTtlaDrkJwg7LqQ7Iuc66W8IOqwgOyngOqzoCDsnojsnYQg7IiYIOyeiOyngOunjCwg6re465+w
IENQVSDrk6TsnYAg7Y+J67KU7ZWcIOuplOuqqOumrA0KPiA+ID4gLeyVoeyEuOyKpOulvCDsnITt
lbTshJzrj4Qg7J20IOu2hO2VoOuQnCDsupDsi5zrk6Qg7IKs7J207J2YIOyhsOygleydhCDtlbTs
lbzrp4wg7ZWp64uI64ukLiAgQWxwaGEg64qUIOqwgOyepQ0KPiA+ID4gLeyVve2VnCDrqZTrqqjr
pqwg7Iic7IScIOyLnOunqO2LsSAoc2VtYW50aWMpIOydhCDshKDtg53tlajsnLzroZzsjagg66mU
66qo66asIOuwsOumrOyWtOqwgCDrqoXsi5zsoIHsnLzroZwNCj4gPiA+IC3sgqzsmqnrkJjsp4Ag
7JWK7JWY7J2EIOuVjOyXkOuKlCDqt7jrn7Ag7KGw7KCV7J20IO2VhOyalO2VmOyngCDslYrqsowg
7ZaI7Jy866mwLCDsnbTripQgQWxwaGEg6rCAIOuLueyLnOyXkA0KPiA+ID4gLeuNlCDrhpLsnYAg
Q1BVIO2BtOudvSDsho3rj4Trpbwg6rCA7KeIIOyImCDsnojqsowg7ZaI7Iq164uI64ukLiAg7ZWY
7KeA66eMLCAo64uk7IucIOunkO2VmOqxtOuMgCwgdjQuMTUNCj4gPiA+IC3snbTtm4TrtoDthLDr
ipQpIEFscGhhIOyVhO2CpO2FjeyzkCDsoITsmqkg7L2U65Oc7JmAIFJFQURfT05DRSgpIOunpO2B
rOuhnCDrgrTrtoDsl5DshJzrpbwg7KCc7Jm47ZWY6rOg64qUDQo+ID4gPiAtc21wX3JlYWRfYmFy
cmllcl9kZXBlbmRzKCkg6rCAIOyCrOyaqeuQmOyngCDslYrslYTslbwg7ZWo7J2EIOyVjOyVhOuR
kOyLnOq4sCDrsJTrno3ri4jri6QuDQo+ID4gPiAtDQo+ID4gPiAtDQo+ID4gPiAg7LqQ7IucIOyd
vOq0gOyEsSBWUyBETUENCj4gPiA+ICAtLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+DQo+ID4gPiBA
QCAtMjk1OSwxMCArMjgyMSw4IEBAIEFscGhhIENQVSDsnZgg7J2867aAIOuyhOyghOydgCDrtoTt
laDrkJwg642w7J207YSwIOy6kOyLnOulvCDqsIDsp4Dqs6Ag7J6I7Ja07IScDQo+ID4gPiAg642w
7J207YSw7J2YIOuwnOqyrOydhCDsmKzrsJTrpbgg7Iic7ISc66GcIOydvOyWtOuCmOqyjCDtlZjq
uLAg65WM66y47J6F64uI64ukLg0KPiA+ID4NCj4gPiA+ICDrpqzriIXsiqQg7Luk64SQ7J2YIOup
lOuqqOumrCDrsLDrpqzslrQg66qo64247J2AIEFscGhhIOyXkCDquLDstIjtlbTshJwg7KCV7J2Y
65CY7JeI7Iq164uI64uk66eMLCB2NC4xNQ0KPiA+ID4gLeu2gO2EsOuKlCDrpqzriIXsiqQg7Luk
64SQ7J20IFJFQURfT05DRSgpIOuCtOyXkCBzbXBfcmVhZF9iYXJyaWVyX2RlcGVuZHMoKSDrpbwg
7LaU6rCA7ZW07IScDQo+ID4gPiAtQWxwaGEg7J2YIOuplOuqqOumrCDrqqjrjbjroZzsnZgg7JiB
7Zal66Cl7J20IO2BrOqyjCDspITslrTrk6TquLQg7ZaI7Iq164uI64ukLg0KPiA+ID4gLQ0KPiA+
ID4gLeychOydmCAi7LqQ7IucIOydvOq0gOyEsSIg7ISc67iM7IS57IWY7J2EIOywuOqzoO2VmOyE
uOyalC4NCj4gPiA+ICvrtoDthLDripQgQWxwaGEg7JqpIFJFQURfT05DRSgpIOy9lOuTnCDrgrTs
l5Agc21wX21iKCkg6rCAIOy2lOqwgOuQmOyWtOyEnCDrqZTrqqjrpqwg66qo642466Gc7J2YDQo+
ID4gPiArQWxwaGEg7J2YIOyYge2WpeugpeydtCDtgazqsowg7KSE7Ja065Ok7JeI7Iq164uI64uk
Lg0KPiA+ID4NCj4gPiA+DQo+ID4gPiAg6rCA7IOBIOuouOyLoCDqsozsiqTtirgNCj4gPiA+IC0t
DQo+ID4gPiAyLjE3LjINCj4gPiA+DQo=
