// Copyright (c) 2011-2014 The Anzucoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BITCOIN_QT_BITCOINADDRESSVALIDATOR_H
#define BITCOIN_QT_BITCOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class AnzucoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit AnzucoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Anzucoin address widget validator, checks for a valid anzucoin address.
 */
class AnzucoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit AnzucoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // BITCOIN_QT_BITCOINADDRESSVALIDATOR_H
